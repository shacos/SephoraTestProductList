// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sephora-Common",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Sephora-Common",
            targets: ["Sephora-Common"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.0"
        ),
        .package(
            url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git",
            from: "2.0.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Sephora-Common",
            dependencies: [
                .product(name: "Swinject", package: "Swinject"),
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver")
            ]
        ),
        .testTarget(
            name: "Sephora-CommonTests",
            dependencies: ["Sephora-Common"]
        ),
    ]
)
