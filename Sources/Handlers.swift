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
import TurnstileCrypto

public class WebHandlers {
	/* =================================================================================================================
	Index
	================================================================================================================= */
	open static func indexHandlerGet(request: HTTPRequest, _ response: HTTPResponse) {

		let rand = URandom()

		request.session.data[rand.secureToken] = rand.secureToken
//		print(request.session.data)
		var dump = ""
		do {
			dump = try request.session.data.jsonEncodedString()
		} catch {
			dump = "\(error)"
		}
		let body = "<p>Your Session ID is: <code>\(request.session.token)</code></p><p>Session data: <code>\(dump)</code></p>"

		response.setBody(string: header+body+footer)
		response.completed()


	}
	/* =================================================================================================================
	/Index
	================================================================================================================= */


	static var header = "<html><head><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\"><title>Perfect Sessions Demo</title><style>.header,body{padding-bottom:20px}.header,.jumbotron{border-bottom:1px solid #e5e5e5}body{padding-top:20px}.footer,.header,.marketing{padding-right:15px;padding-left:15px}.header h3{margin-top:0;margin-bottom:0;line-height:40px}.footer{padding-top:19px;color:#777;border-top:1px solid #e5e5e5}@media (min-width:768px){.container{max-width:730px}}.container-narrow>hr{margin:30px 0}.jumbotron{text-align:center}.jumbotron .btn{padding:14px 24px;font-size:21px}.marketing{margin:40px 0}.marketing p+h4{margin-top:28px}@media screen and (min-width:768px){.footer,.header,.marketing{padding-right:0;padding-left:0}.header{margin-bottom:30px}.jumbotron{border-bottom:0}}</style></head><body><div class=\"container\"><div class=\"header clearfix\"><h3 class=\"text-muted\"><a href=\"/\">Perfect Sessions Demo</a></h3></div>"

	static var footer = "</div></body></html>"
}
