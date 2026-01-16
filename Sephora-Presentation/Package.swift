// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sephora-Presentation",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Sephora-Presentation",
            targets: ["Sephora-Presentation"]
        ),
    ],
    dependencies: [
        .package(path: "../Sephora-Common"),
        .package(path: "../Sephora-Domain")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Sephora-Presentation",
            dependencies: [
                "Sephora-Common",
                "Sephora-Domain"
            ],
            resources: [.process("Resources/Assets.xcassets")]
        ),
        .testTarget(
            name: "Sephora-PresentationTests",
            dependencies: ["Sephora-Presentation"]
        ),
    ]
)
