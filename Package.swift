// swift-tools-version:5.6

/**
*  Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "Publish",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "Publish", targets: ["Publish"]),
        .executable(name: "publish-cli", targets: ["PublishCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/Ink.git", from: "0.5.1"),
        //.package(url: "https://github.com/johnsundell/Plot.git", from: "0.11.0"),
        .package(url: "https://github.com/mwermeester/Plot.git", branch: "remove-twitter-meta-tags"),
        .package(url: "https://github.com/johnsundell/Files.git", from: "4.0.0"),
        .package(url: "https://github.com/johnsundell/Codextended.git", from: "0.1.0"),
        .package(url: "https://github.com/johnsundell/ShellOut.git", from: "2.3.0"),
        .package(url: "https://github.com/johnsundell/Sweep.git", from: "0.4.0"),
        .package(url: "https://github.com/johnsundell/CollectionConcurrencyKit.git", from: "0.1.0")
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
