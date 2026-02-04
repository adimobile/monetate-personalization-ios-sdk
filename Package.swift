// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Monetate",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Monetate",
            targets: [
                "Monetate"
            ]
        )
    ],
    targets: [
        .target(
            name: "Monetate",
            path: "Sources/monetate",
            resources: [.process("Resources/Version.plist")]
        )
    ],
    swiftLanguageModes: [
        .version("5")
    ]
)
