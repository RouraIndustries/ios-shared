// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RouraTools",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RouraTools",
            targets: ["RouraTools"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RouraTools",
            resources: [
                .process("Assets/Fonts/Lexend-Bold.ttf"),
                .process("Assets/Fonts/Lexend-ExtraLight.ttf"),
                .process("Assets/Fonts/Lexend-Medium.ttf"),
                .process("Assets/Fonts/Lexend-Thin.ttf"),
                .process("Assets/Fonts/Montserrat-ExtraBold.ttf"),
                .process("Assets/Fonts/Montserrat-SemiBold.ttf"),
                .process("Assets/Fonts/Montserrat-Regular.ttf")
            ]
        ),
        .testTarget(
            name: "RouraToolsTests",
            dependencies: ["RouraTools"]
        ),
    ]
)
