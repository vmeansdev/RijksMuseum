// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RijksUI",
    platforms: [.macOS(.v12), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RijksUI",
            targets: ["RijksUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.0.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.12.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RijksUI",
            dependencies: ["Kingfisher"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "RijksUITests",
            dependencies: ["RijksUI", .product(name: "SnapshotTesting", package: "swift-snapshot-testing")]
        ),
    ]
)
