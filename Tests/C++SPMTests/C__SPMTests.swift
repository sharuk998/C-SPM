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
    
    func testSubtraction() {
        XCTAssertEqual(calculator.subtract(10, 4), 6)
    }
    
    func testMultiplication() {
        XCTAssertEqual(calculator.multiply(2.5, 2.0), 5.0)
    }
    
    func testDivision() {
        XCTAssertEqual(calculator.divide(10.0, 2.0), 5.0)
        XCTAssertEqual(calculator.divide(10.0, 0.0), 0.0) // Test division by zero handling
    }
}
