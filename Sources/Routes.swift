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

	return routes
}
