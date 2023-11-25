// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "SQLite2.swift",
  platforms: [
    .iOS(.v11),
    .macOS(.v10_13),
    .watchOS(.v4),
    .tvOS(.v11),
  ],
  products: [
    .library(
      name: "SQLite2",
      targets: ["SQLite2"]
    )
  ],
  targets: [
    .target(
      name: "SQLite2",
      exclude: [
        "Info.plist"
      ]
    ),
    .testTarget(
      name: "SQLiteTests",
      dependencies: [
        "SQLite2"
      ],
      path: "Tests/SQLiteTests",
      exclude: [
        "Info.plist"
      ],
      resources: [
        .copy("Resources")
      ]
    ),
  ]
)

#if os(Linux)
  package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
  ]
  package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
  ]
#endif
