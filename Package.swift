// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Testables",
  products: [
    .library(name: "Testables", targets: ["Testables"]),
  ],
  targets: [
    .target(name: "Testables", dependencies: []),
    .target(name: "TestablesExample", dependencies: ["Testables"]),
    .testTarget(name: "TestablesTests", dependencies: ["Testables", "TestablesExample"]),
  ]
)
