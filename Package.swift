// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DebugActions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "DebugActions", type: .dynamic, targets: ["DebugActions"])
    ],
    targets: [
        .target(
            name: "DebugActions")
    ]
)
