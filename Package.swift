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
            name: "RouraUIKit",
            targets: [
                "RouraUIKit"
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
                .process("Assets/Fonts/Lexend/Lexend-Bold.ttf"),
                .process("Assets/Fonts/Lexend/Lexend-ExtraLight.ttf"),
                .process("Assets/Fonts/Lexend/Lexend-Medium.ttf"),
                .process("Assets/Fonts/Lexend/Lexend-Thin.ttf"),

                .process("Assets/Fonts/Montserrat/Montserrat-ExtraBold.ttf"),
                .process("Assets/Fonts/Montserrat/Montserrat-SemiBold.ttf"),
                .process("Assets/Fonts/Montserrat/Montserrat-Regular.ttf")
            ]
        ),
        .testTarget(
            name: "TuxedoTests",
            dependencies: [
                "Tuxedo"
            ]
        ),
        .target(
            name: "RouraUIKit",
            dependencies: [
                "RouraFoundation",
                "Tuxedo"
            ]
        ),
        .testTarget(
            name: "RouraUIKitTests",
            dependencies: [
                "RouraUIKit"
            ],
            resources: [
                .copy("Resources/app-icon.png")
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
