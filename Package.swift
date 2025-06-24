// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CxxSPM",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CxxSPM",
            type: .dynamic,  // Explicitly specify dynamic library
            targets: ["CxxSPM"]),
        .executable(
            name: "OpenCVTest",
            targets: ["OpenCVTest"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(
            name: "COpenCV",
            pkgConfig: "opencv4",
            providers: [
                .brew(["opencv"]),
                .apt(["libopencv-dev"])
            ]
        ),
        .target(
            name: "CxxLib",
            dependencies: ["COpenCV"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("include"),
                .unsafeFlags([
                    "-I/usr/local/include/opencv4",
                    "-isystem", "/Library/Developer/CommandLineTools/usr/include/c++/v1"
                ]), // Use unsafe flags for system paths
                .define("OPENCV_DISABLE_EIGEN_TENSOR_SUPPORT") // Avoid potential conflicts
            ],
            linkerSettings: [
                .linkedFramework("Accelerate"), // Required by OpenCV on macOS
                .linkedLibrary("opencv_core"),
                .linkedLibrary("opencv_imgproc"),
                .linkedLibrary("opencv_imgcodecs")
            ]
        ),
        .target(
            name: "CxxSPM",
            dependencies: ["CxxLib"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .executableTarget(
            name: "OpenCVTest",
            dependencies: ["CxxSPM"],
            path: "Examples",
            sources: ["OpenCVTest.swift"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .testTarget(
            name: "C++SPMTests",
            dependencies: ["CxxSPM"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
