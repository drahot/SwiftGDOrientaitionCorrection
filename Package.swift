// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGDOrientationCorrection",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftGDOrientationCorrection",
            targets: ["SwiftGDOrientationCorrection"]),
    ],
    dependencies: [
        .package(url: "https://github.com/twostraws/SwiftGD.git", branch: "main"),
        .package(url: "https://github.com/kradalby/SwiftExif.git", from: "0.0.7")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftGDOrientationCorrection",
            dependencies: [
                .product(name: "SwiftGD", package: "swiftgd"),
                .product(name: "SwiftExif", package: "swiftexif"),
            ]
        ),
        .testTarget(
            name: "SwiftGDOrientationCorrectionTests",
            dependencies: ["SwiftGDOrientationCorrection"]),
    ]
)
