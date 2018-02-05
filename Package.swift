import PackageDescription

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    
let package = Package(
    name: "EAKit",
    products: [
        .library(name: "EAKit", targets: ["EAKit"]),
        ],
    targets: [
        .target(name: "EAKit", dependencies: ["c11_atomic"]),
        .target(name: "c11_atomic", dependencies: []),
        ]
)
    
#elseif os(Linux)
    
let package = Package(
    name: "EAKit",
    products: [
        .library(name: "EAKit", targets: ["EAKit"]),
        ],
    targets: [
        .target(name: "EAKit", dependencies: ["c11_atomic", "zlib"]),
        .target(name: "c11_atomic", dependencies: []),
        .target(name: "zlib", dependencies: []),
        ]
)
    
#endif
