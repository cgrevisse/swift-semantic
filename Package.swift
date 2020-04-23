// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "swift-semantic",
    products: [
        .library(name: "swift-semantic", targets: ["swift-semantic"]),
    ],
    dependencies: [
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .revision("0.50200.0")), // Xcode 11.4, Swift 5.2
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    ],
    targets: [
        .target(name: "swift-semantic", dependencies: ["SwiftSyntax", .product(name: "ArgumentParser", package: "swift-argument-parser"),]),
    ]
)
