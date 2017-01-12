//
//  File.swift
//  Perfect-Session-Memory-Demo
//
//  Created by Jonathan Guthrie on 2016-12-15.
//
//

import PerfectLib
import PerfectHTTP

public func makeWebDemoRoutes() -> Routes {
	var routes = Routes()

	routes.add(method: .get, uri: "/", handler: WebHandlers.indexHandlerGet)
	routes.add(method: .get, uri: "/nocsrf", handler: WebHandlers.formNoCSRF)
	routes.add(method: .get, uri: "/withcsrf", handler: WebHandlers.formWithCSRF)
	routes.add(method: .post, uris: ["/nocsrf", "/withcsrf"], handler: WebHandlers.formReceive)

	return routes
}
