// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftDocs",
    platforms: [
            .macOS(.v10_15),
            .iOS(.v13),
            .tvOS(.v13),
            .watchOS(.v6)
        ],
    products: [
        .library(
            name: "SwiftDocs",
            targets: ["SwiftDocs"]),
    ],
    targets: [
        .target(
            name: "SwiftDocs"),
        .testTarget(
            name: "SwiftDocsTests",
            dependencies: ["SwiftDocs"]
        ),
    ]
)
