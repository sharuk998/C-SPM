# Creating a Swift Package with C++ Code

This guide outlines the steps to create a Swift Package that uses C++ code directly using Swift's C++ interoperability feature.

## Initial Setup

1. Create a new Swift package:
   ```bash
   swift package init --type library
   ```

## Directory Structure Setup

2. Create the necessary directories for C++ code:
   ```bash
   mkdir -p Sources/CxxLib/include
   ```

## C++ Implementation

3. Create an umbrella header (`Sources/CxxLib/include/CxxLib.h`):
   ```cpp
   #pragma once
   
   #include "Calculator.hpp"
   ```

4. Create the C++ header file (`Sources/CxxLib/include/Calculator.hpp`):
   ```cpp
   #pragma once
   
   class Calculator {
   public:
       Calculator() = default;
       
       int add(int a, int b) {
           return a + b;
       }
       
       int subtract(int a, int b) {
           return a - b;
       }
       
       double multiply(double a, double b) {
           return a * b;
       }
       
       double divide(double a, double b) {
           if (b == 0) {
               return 0.0; // Simple error handling
           }
           return a / b;
       }
   };
   ```

## Swift Integration

5. Create a Swift wrapper (`Sources/CxxSPM/Calculator.swift`):
   ```swift
   import CxxLib

   public class SwiftCalculator {
       private var calculator: Calculator
       
       public init() {
           calculator = Calculator()
       }
       
       public func add(_ a: Int32, _ b: Int32) -> Int32 {
           return calculator.add(a, b)
       }
       
       // ... other methods
   }
   ```

## Package Configuration

6. Configure `Package.swift`:
   ```swift
   // swift-tools-version: 5.9
   import PackageDescription

   let package = Package(
       name: "CxxSPM",
       platforms: [
           .macOS(.v10_15)
       ],
       products: [
           .library(
               name: "CxxSPM",
               targets: ["CxxSPM"])
       ],
       targets: [
           .target(
               name: "CxxLib",
               publicHeadersPath: "include"
           ),
           .target(
               name: "CxxSPM",
               dependencies: ["CxxLib"],
               swiftSettings: [.interoperabilityMode(.Cxx)]
           ),
           .testTarget(
               name: "C++SPMTests",
               dependencies: ["CxxSPM"],
               swiftSettings: [.interoperabilityMode(.Cxx)]
           )
       ]
   )
   ```

## Testing

7. Create unit tests in `Tests/C++SPMTests/C__SPMTests.swift`:
   ```swift
   import XCTest
   @testable import CxxSPM

   final class C__SPMTests: XCTestCase {
       var calculator: SwiftCalculator!
       
       override func setUp() {
           super.setUp()
           calculator = SwiftCalculator()
       }
       
       func testAddition() {
           XCTAssertEqual(calculator.add(5, 3), 8)
       }
       
       // ... other test methods
   }
   ```

## Using the Package

8. To use in a macOS/iOS project:
   - Add the package as a dependency in Xcode
   - Import the module: `import CxxSPM`
   - Use the Swift wrapper:
     ```swift
     let calculator = SwiftCalculator()
     let result = calculator.add(5, 3)
     ```

## Key Points

9. Important things to note:
   - Enable C++ interoperability using `.interoperabilityMode(.Cxx)`
   - Use an umbrella header to expose C++ APIs
   - C++ types can be used directly in Swift
   - No need for Objective-C++ bridging
   - Swift handles memory management automatically

## Requirements

10. System requirements:
    - Swift 5.9 or later
    - Xcode 15 or later (for Xcode projects)
    - macOS 10.15 or later 