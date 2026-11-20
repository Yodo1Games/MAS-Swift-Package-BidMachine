// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationBidMachine",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationBidMachine", targets: ["Yodo1MasMediationBidMachineTarget"]),
        .library(name: "Yodo1MasMediationBidMachine-AppLovinMediationBidMachineAdapter", targets: ["Yodo1MasMediationBidMachine-AppLovinMediationBidMachineAdapterTarget"]),
        .library(name: "Yodo1MasMediationBidMachine-GoogleBidMachineAdapter", targets: ["Yodo1MasMediationBidMachine-GoogleBidMachineAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/bidmachine/BidMachine-SPM.git", exact: "3.8.1"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationBidMachine ====================
        .target(
            name: "Yodo1MasMediationBidMachineTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationBidMachine"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "BidMachine", package: "BidMachine-SPM"),
            ],
            path: "Sources/Yodo1MasMediationBidMachineTarget",
            resources: [.copy("Yodo1MasBidMachine.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationBidMachine",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationBidMachine/Yodo1MasMediationBidMachine-5.0.0-beta.5.zip",
            checksum: "a39438e1f674c2d2c34e5312607ad1f80f38bf6eef572a22d8bfe9e34cd407d9"
        ),
        // ==================== Yodo1MasMediationBidMachine-AppLovinMediationBidMachineAdapter ====================
        .target(
            name: "Yodo1MasMediationBidMachine-AppLovinMediationBidMachineAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationBidMachineTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationBidMachineAdapter"),
            ],
            path: "Sources/Yodo1MasMediationBidMachine-AppLovinMediationBidMachineAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationBidMachineAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationBidMachine/AppLovinMediationBidMachineAdapter-5.0.0-beta.5.zip",
            checksum: "1c46ea8374d3e8bf67dfe05ef2137ece1bb26fa718bfd8d5522828bfea453af4"
        ),
        // ==================== Yodo1MasMediationBidMachine-GoogleBidMachineAdapter ====================
        .target(
            name: "Yodo1MasMediationBidMachine-GoogleBidMachineAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationBidMachineTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "GoogleBidMachineAdapter"),
            ],
            path: "Sources/Yodo1MasMediationBidMachine-GoogleBidMachineAdapterTarget"
        ),
        .binaryTarget(
            name: "GoogleBidMachineAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationBidMachine/GoogleBidMachineAdapter-5.0.0-beta.5.zip",
            checksum: "fbf833e26c3f80cc0b94a390945eaff8ced0a31eff123d49204f8d9f126cfff1"
        ),
    ]
)
