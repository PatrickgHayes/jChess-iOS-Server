import Foundation

import KituraWebSocket

class ChessService: WebSocketService {

    private var connections = [String: WebSocketConnection]()

    let connectionTimeout: Int? = 60

    public func connected(connection: WebSocketConnection) {
        if connections.count == 0 {
            print("Player 1 has joined")
            connections[connection.id] = connection
            connection.send(message: "You have joined as player 1")
        } else if connections.count == 1{
            print("Player 2 has joined")
            connections[connection.id] = connection
            connection.send(message: "You have joined as player 2")
        } else {
            print("A third player tried to join and was rejected")
            connection.send(message: "Two players already exist. Come back later.")
        }
    }

    public func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        print("A player has disconnected")
        connections.removeValue(forKey: connection.id)
        for (_, connection) in connections {
            connection.send(message: "Your opponent has disconnected")
        }
    }

    public func received(message: Data, from: WebSocketConnection) {
        from.close(reason: .invalidDataType, description: "Chat-Server only accepts text messages")

        connections.removeValue(forKey: from.id)
    }

    public func received(message: String, from: WebSocketConnection) {
        print(message)
        do {
            let command = try parser.parse(user_input: message, chessBoard: chessBoard)
            command.execute()
            for (connectionId, connection) in connections {
                if connectionId != from.id {
                    connection.send(message: message)
                }
            }
        }
        catch {
            print(error.localizedDescription)
            from.send(message: "Invalid command. Please enter again.")
        }
    }
}

