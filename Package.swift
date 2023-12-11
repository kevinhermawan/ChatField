// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatField",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "ChatField",
            targets: ["ChatField"]),
    ],
    dependencies: [
        .package(url: "https://github.com/siteline/swiftui-introspect.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMajor(from: "1.3.0"))
    ],
    targets: [
        .target(
            name: "ChatField",
            dependencies: [
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect")
            ]),
        .testTarget(
            name: "ChatFieldTests",
            dependencies: ["ChatField"]),
    ]
)
