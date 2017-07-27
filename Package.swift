// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "FengNiaoModify",
    targets: [
        Target(name: "FengNiaoModifyKit", dependencies: []),
        Target(name: "FengNiaoModify", dependencies: ["FengNiaoModifyKit"])
    ],
    dependencies: [
        .Package(url: "https://github.com/jatoben/CommandLine.git", "3.0.0-pre1"),
        .Package(url: "https://github.com/onevcat/Rainbow.git", majorVersion: 2),
        .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0, minor: 8)
    ]
)
