// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Slime",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Slime",
      targets: ["Slime"]),
  ],
  dependencies: [
    .package(url: "https://github.com/airbnb/lottie-ios.git", from: "3.0.0"),
  ],
  targets: [
    .target(
      name: "Slime",
      dependencies: [
        .product(name: "Lottie", package: "lottie-ios")
      ],
      resources: [
        .process("Resources/Blob.json"),
        .process("Resources/Blob.mp3")
      ]
    ),
  ]
)
