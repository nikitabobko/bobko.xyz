// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "rssgen",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Plot", exact: "0.14.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "rssgen",
            dependencies: [
                .product(name: "Plot", package: "Plot")
            ]
        ),
    ]
)
