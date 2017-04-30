//
//  Handlers.swift
//  Perfect-Session-Memory-Demo
//
//  Created by Jonathan Guthrie on 2016-12-15.
//
//


import PerfectLib
import PerfectHTTP
import PerfectSession
import Foundation

public class WebHandlers {
	/* =================================================================================================================
	Index
	================================================================================================================= */
	open static func indexHandlerGet(request: HTTPRequest, _ response: HTTPResponse) {
		guard request.session != nil else {
			response.setBody(string: "no session")
			response.completed()
			return
		}

		var session = request.session!
		let secureToken = UUID().uuidString

		session.data[secureToken] = secureToken
		var dump = ""
		do {
			dump = try session.data.jsonEncodedString()
		} catch {
			dump = "\(error)"
		}
		var body = "<p>Your Session ID is: <code>\(session.token)</code></p><p>Session data: <code>\(dump)</code></p>"
		body += "<p><a href=\"/withcsrf\">CSRF Test Form</a></p>"
		body += "<p><a href=\"/nocsrf\">No CSRF Test Form</a></p>"

		response.setBody(string: header+body+footer)
		response.completed()


	}


	/* =================================================================================================================
	CORS
	================================================================================================================= */
	open static func CORSHandlerGet(request: HTTPRequest, _ response: HTTPResponse) {

		response.addHeader(.contentType, value: "application/json")
		do {
			try response.setBody(json: ["Success":"CORS Request"])
		} catch {
			response.setBody(string: "error encoding response")
		}
		response.completed()

	}



	/* =================================================================================================================
	formNoCSRF
	================================================================================================================= */
	open static func formNoCSRF(request: HTTPRequest, _ response: HTTPResponse) {
		guard let session = request.session else {
			response.setBody(string: "no session")
			response.completed()
			return
		}

		var body = "<p>Your Session ID is: <code>\(session.token)</code></p><form method=\"POST\" action=\"?\" enctype=\"multipart/form-data\">"
		body += "<p>No CSRF Form</p>"
		body += "<p>NOTE: You should get a failed request because there is no CSRF</p>"
		body += "<p><input type=\"text\" name=\"testing\" value=\"testing123\"></p>"
		body += "<p><input type=\"submit\" name=\"submit\" value=\"submit\"></p>"
		body += "</form>"
		response.setBody(string: header+body+footer)
		response.completed()

	}

	/* =================================================================================================================
	formWithCSRF
	================================================================================================================= */
	open static func formWithCSRF(request: HTTPRequest, _ response: HTTPResponse) {
		guard let session = request.session else {
			response.setBody(string: "no session")
			response.completed()
			return
		}
		let t = session.data["csrf"] as? String ?? ""
		var body = "<p>Your Session ID is: <code>\(session.token)</code></p><form method=\"POST\" action=\"?\" enctype=\"multipart/form-data\">"
		body += "<p>CSRF Form</p>"
		body += "<p><input type=\"text\" name=\"testing\" value=\"testing123\"></p>"
		body += "<p><input type=\"text\" name=\"_csrf\" value=\"\(t)\"></p>"
		body += "<p><input type=\"submit\" name=\"submit\" value=\"submit\"></p>"
		body += "</form>"
		response.setBody(string: header+body+footer)
		response.completed()

	}

	/* =================================================================================================================
	formReceive
	================================================================================================================= */
	open static func formReceive(request: HTTPRequest, _ response: HTTPResponse) {
		guard let session = request.session else {
			response.setBody(string: "no session")
			response.completed()
			return
		}
		var body = "<p>Your Session ID is: <code>\(session.token)</code></p>"
		body += "<p>CSRF Test response</p>"
		body += "<p>Params: \(request.postParams)</p>"
		response.setBody(string: header+body+footer)
		response.completed()

	}




	static var header = "<html><head><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\"><title>Perfect Sessions Demo</title><style>.header,body{padding-bottom:20px}.header,.jumbotron{border-bottom:1px solid #e5e5e5}body{padding-top:20px}.footer,.header,.marketing{padding-right:15px;padding-left:15px}.header h3{margin-top:0;margin-bottom:0;line-height:40px}.footer{padding-top:19px;color:#777;border-top:1px solid #e5e5e5}@media (min-width:768px){.container{max-width:730px}}.container-narrow>hr{margin:30px 0}.jumbotron{text-align:center}.jumbotron .btn{padding:14px 24px;font-size:21px}.marketing{margin:40px 0}.marketing p+h4{margin-top:28px}@media screen and (min-width:768px){.footer,.header,.marketing{padding-right:0;padding-left:0}.header{margin-bottom:30px}.jumbotron{border-bottom:0}}</style></head><body><div class=\"container\"><div class=\"header clearfix\"><h3 class=\"text-muted\"><a href=\"/\">Perfect Sessions Demo</a></h3></div>"

	static var footer = "</div></body></html>"
}
