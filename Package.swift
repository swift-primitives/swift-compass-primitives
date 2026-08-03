// swift-tools-version: 6.3.3
import PackageDescription

let package = Package(
    name: "swift-compass-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        // MARK: - Namespace
        .library(name: "Compass Primitive", targets: ["Compass Primitive"]),

        // MARK: - Sub-namespace targets
        .library(name: "Compass Equation Primitives", targets: ["Compass Equation Primitives"]),
        .library(name: "Compass Hash Primitives", targets: ["Compass Hash Primitives"]),
        .library(name: "Compass Comparison Primitives", targets: ["Compass Comparison Primitives"]),

        // MARK: - Umbrella
        .library(name: "Compass Primitives", targets: ["Compass Primitives"]),

        // MARK: - Test Support
        .library(name: "Compass Primitives Test Support", targets: ["Compass Primitives Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-equation-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-hash-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-comparison-primitives.git", branch: "main"),
    ],
    targets: [
        // MARK: - Namespace (zero external dependencies — [MOD-017]; CaseIterable is stdlib)
        .target(name: "Compass Primitive", dependencies: []),

        // MARK: - Sub-namespace targets (per [MOD-031]): institute Equatable/Hashable/Comparable twins
        .target(
            name: "Compass Equation Primitives",
            dependencies: [
                "Compass Primitive",
                .product(name: "Equation Primitives", package: "swift-equation-primitives"),
            ]
        ),
        .target(
            name: "Compass Hash Primitives",
            dependencies: [
                "Compass Primitive",
                .product(name: "Hash Primitives", package: "swift-hash-primitives"),
            ]
        ),
        .target(
            name: "Compass Comparison Primitives",
            dependencies: [
                "Compass Primitive",
                .product(name: "Comparison Primitives", package: "swift-comparison-primitives"),
            ]
        ),

        // MARK: - Umbrella
        .target(
            name: "Compass Primitives",
            dependencies: [
                "Compass Primitive",
                "Compass Equation Primitives",
                "Compass Hash Primitives",
                "Compass Comparison Primitives",
            ]
        ),

        // MARK: - Test Support
        .target(
            name: "Compass Primitives Test Support",
            dependencies: [
                "Compass Primitives"
            ],
            path: "Tests/Support"
        ),

        // MARK: - Tests
        .testTarget(
            name: "Compass Primitives Tests",
            dependencies: [
                "Compass Primitives",
                "Compass Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
