// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "LD51",
    products: [
        .executable(name: "LD51", targets: ["LD51Site"]),
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "LD51Site",
            dependencies: [
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
