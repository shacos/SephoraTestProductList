// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sephora-Router",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Sephora-Router",
            targets: ["Sephora-Router"]
        ),
    ],
    dependencies: [
        .package(path: "../Sephora-Presentation")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Sephora-Router",
            dependencies: [
                "Sephora-Presentation"
            ],
        ),
        .testTarget(
            name: "Sephora-RouterTests",
            dependencies: ["Sephora-Router"]
        ),
    ]
)
