import Foundation

import Kitura
import KituraWebSocket

import HeliumLogger
import LoggerAPI

// Using an implementation for a Logger
//HeliumLogger.use(.info)
//
//WebSocket.register(service: ChessService(), onPath: "chess")
//
//class ChessServerDelegate: ServerDelegate {
//    public func handle(request: ServerRequest, response: ServerResponse) {}
//}
//
//// Add HTTP Server to listen on port 8080
//let server = HTTP.createServer()
//server.delegate = ChessServerDelegate()
//
//let chessBoard = ChessBoard()
//let parser = Parser()
//
//do {
//    try server.listen(on: 8081)
//    ListenerGroup.waitForListeners()
//} catch {
//    Log.error("Error listening on port 8080: \(error).")
//}

// All Web apps need a router to define routes
let router = Router()

// Using an implementation for a Logger
HeliumLogger.use(.info)

// Serve the files in the public directory for the web client
router.get("/secret") { request, response, next in
    response.send("treasure")
    next()
}

WebSocket.register(service: ChessService(), onPath: "chess")
let chessBoard = ChessBoard()
let parser = Parser()

// Add HTTP Server to listen on the appropriate port
Kitura.addHTTPServer(onPort: 8081, with: router)

// Start the framework - the servers added until now will start listening
Kitura.run()
