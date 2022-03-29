// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "VaporLibrary",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
      .library(name: "VaporLibrary", type: .dynamic, targets: ["VaporLibrary"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
      .package(url: "https://github.com/vapor/vapor.git", .exact("4.55.3")),
      .package(url: "https://github.com/vapor/fluent.git", .exact("4.4.0")),
      .package(url: "https://github.com/vapor/fluent-mysql-driver.git", .exact("4.0.2")),
      .package(url: "https://github.com/vapor/leaf.git", .exact("4.1.5")),
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
