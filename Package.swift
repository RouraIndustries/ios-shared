// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RouraTools",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "RouraFoundation",
            targets: [
                "RouraFoundation"
            ]
        ),
        .library(
            name: "Tuxedo",
            targets: [
                "Tuxedo"
            ]
        ),
        .library(
            name: "RouraSwiftUI",
            targets: [
                "RouraSwiftUI"
            ]
        )
    ],
    targets: [
        .target(
            name: "RouraFoundation"
        ),
        .testTarget(
            name: "RouraFoundationTests",
            dependencies: [
                "RouraFoundation"
            ]
        ),
        .target(
            name: "Tuxedo",
            dependencies: [
                "RouraFoundation"
            ],
            resources: [
                .process("Assets/Fonts/Montserrat-ExtraBold.ttf"),
                .process("Assets/Fonts/Montserrat-SemiBold.ttf"),
                .process("Assets/Fonts/Montserrat-Regular.ttf")
            ]
        ),
        .testTarget(
            name: "TuxedoTests",
            dependencies: [
                "Tuxedo"
            ]
        ),
        .target(
            name: "RouraSwiftUI",
            dependencies: [
                "RouraFoundation",
                "Tuxedo"
            ]
        ),
        .testTarget(
            name: "RouraSwiftUITests",
            dependencies: [
                "RouraSwiftUI"
            ]
        )
    ]
)
