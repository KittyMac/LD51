// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "LD51",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "LD51", targets: ["LD51Site"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/KittyMac/Flynn.git", from: "0.3.0"),
        .package(url: "https://github.com/KittyMac/Picaroon.git", from: "0.4.0"),
        .package(url: "https://github.com/KittyMac/Pamphlet.git", from: "0.3.0"),
    ],
    targets: [
        .executableTarget(
            name: "LD51Site",
            dependencies: [
                "Flynn",
                "Picaroon",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "PamphletFramework", package: "Pamphlet"),
            ],
            plugins: [
                .plugin(name: "PamphletPlugin", package: "Pamphlet"),
                .plugin(name: "FlynnPlugin", package: "Flynn")
            ]
        ),
        .testTarget(
            name: "LD51Tests",
            dependencies: [
                "LD51Site"
            ]
        ),
    ]
)
