// swift-tools-version:5.0

import PackageDescription

let pkg = Package(name: "ArculusPromiseKit")
pkg.platforms = [
   .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
]
pkg.products = [
    .library(name: "ArculusPromiseKit", targets: ["ArculusPromiseKit"]),
]

let pmk: Target = .target(name: "ArculusPromiseKit")
pmk.path = "Sources"
pmk.exclude = [
    "AnyPromise.swift",
    "AnyPromise.m",
    "PMKCallVariadicBlock.m",
    "dispatch_promise.m",
    "join.m",
    "when.m",
    "NSMethodSignatureForBlock.m",
    "after.m",
    "hang.m",
    "race.m",
    "Deprecations.swift"
]
pkg.swiftLanguageVersions = [.v4, .v4_2, .v5]
pkg.targets = [
    pmk,
    .testTarget(name: "APlus", dependencies: ["ArculusPromiseKit"], path: "Tests/A+"),
    .testTarget(name: "CorePromise", dependencies: ["ArculusPromiseKit"], path: "Tests/CorePromise"),
]
