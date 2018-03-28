// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "vapor-docker-compose",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from :"3.0.0-rc.2"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on postgresql.
        .package(url: "https://github.com/vapor/fluent-postgresql", from: "1.0.0-rc.2")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentPostgreSQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

