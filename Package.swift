// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "VaporLibrary",
    products: [
      .library(name: "VaporLibrary", type: .dynamic, targets: ["VaporLibrary"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
      .package(url: "https://github.com/vapor/vapor.git", from: "4.77.0"),
      .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
      .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.3.0"),
      .package(url: "https://github.com/vapor/leaf.git", from: "4.2.4"),
    ],
    targets: [
        .target(
            name: "VaporLibrary",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        )
    ]
)
