// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aiReachability",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "aiReachability", targets: ["aiReachability"]),
    ],
    targets: [
        .target(name: "aiReachability", dependencies: [], path: "aiReachability/aiReachability"),
    ]
)
