//
//  main.swift
//  Perfect Session MySQL Demo
//
//  Created by Jonathan Guthrie on 2017-01-05.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 20176 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//



import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectSession
import PerfectSessionMySQL

let server = HTTPServer()

SessionConfig.name = "TestingMySQLDrivers"
SessionConfig.idle = 60

// Optional
SessionConfig.cookieDomain = "localhost"
SessionConfig.IPAddressLock = true
SessionConfig.userAgentLock = true
SessionConfig.CSRF.checkState = true

SessionConfig.CORS.enabled = true
SessionConfig.CORS.acceptableHostnames.append("http://www.test-cors.org")
//SessionConfig.CORS.acceptableHostnames.append("*.test-cors.org")
SessionConfig.CORS.maxAge = 60

MySQLSessionConnector.host = "127.0.0.1"
MySQLSessionConnector.port = 3306
MySQLSessionConnector.username = "perfect"
MySQLSessionConnector.password = "perfect"
MySQLSessionConnector.database = "perfect_testing"
MySQLSessionConnector.table = "sessions"

let sessionDriver = SessionMySQLDriver()

server.setRequestFilters([sessionDriver.requestFilter])
server.setResponseFilters([sessionDriver.responseFilter])

server.addRoutes(makeWebDemoRoutes())
server.serverPort = 8181

AuthFilter.authenticationConfig.include("*")

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
