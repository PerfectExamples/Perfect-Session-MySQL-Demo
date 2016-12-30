

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

MySQLSessionConnector.host = "localhost"
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

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
