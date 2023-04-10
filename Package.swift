// swift-tools-version:5.8

/**
*  Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "Publish",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "Publish", targets: ["Publish"]),
        .executable(name: "publish-cli", targets: ["PublishCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/Ink.git", exact: "0.6.0"),
        //.package(url: "https://github.com/johnsundell/Plot.git", exact: "0.13.0"),
        .package(url: "https://github.com/mwermeester/Plot.git", branch: "remove-twitter-meta-tags"),
        .package(url: "https://github.com/johnsundell/Files.git", from: "4.2.0"),
        .package(url: "https://github.com/johnsundell/Codextended.git", from: "0.3.0"),
        .package(url: "https://github.com/johnsundell/ShellOut.git", from: "2.3.0"),
        .package(url: "https://github.com/johnsundell/Sweep.git", from: "0.4.0"),
        .package(url: "https://github.com/johnsundell/CollectionConcurrencyKit.git", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "Publish",
            dependencies: [
                "Ink", "Plot", "Files", "Codextended",
                "ShellOut", "Sweep", "CollectionConcurrencyKit"
            ]
        ),
        .executableTarget(
            name: "PublishCLI",
            dependencies: ["PublishCLICore"]
        ),
        .target(
            name: "PublishCLICore",
            dependencies: ["Publish"]
        ),
        .testTarget(
            name: "PublishTests",
            dependencies: ["Publish", "PublishCLICore"]
        )
    ]
)
