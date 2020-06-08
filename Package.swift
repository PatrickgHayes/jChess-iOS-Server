// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "jChess-iOS-Server",
    dependencies: [
         .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.9.1")),
         .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
         .package(url: "https://github.com/IBM-Swift/Kitura-WebSocket.git", from: "2.1.2"),
    ],
    targets: [
        .target(
            name: "jChess-iOS-Server",
            dependencies: ["Kitura", "HeliumLogger", "Kitura-WebSocket"]),
        .testTarget(
            name: "jChess-iOS-ServerTests",
            dependencies: ["jChess-iOS-Server"]),
    ]
)
