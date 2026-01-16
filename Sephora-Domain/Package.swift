// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sephora-Domain",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Sephora-Domain",
            targets: ["Sephora-Domain"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Sephora-Domain",
            dependencies: [
                .product(name: "Swinject", package: "Swinject")
            ]
        ),
        .testTarget(
            name: "Sephora-DomainTests",
            dependencies: ["Sephora-Domain"]
        ),
    ]
)
