// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdaptiveGrid",
    platforms: [
        .macOS(.v11),
        .watchOS(.v7),
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "AdaptiveGrid", targets: ["AdaptiveGrid"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "AdaptiveGrid", dependencies: []),
    ]
)
