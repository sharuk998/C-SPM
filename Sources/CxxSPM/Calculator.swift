import CxxLib

public class SwiftCalculator {
    private var calculator: Calculator
    
    public init() {
        calculator = Calculator()
    }
    
    public func add(_ a: Int32, _ b: Int32) -> Int32 {
        return calculator.add(a, b)
    }
    
    public func subtract(_ a: Int32, _ b: Int32) -> Int32 {
        return calculator.subtract(a, b)
    }
    
    public func multiply(_ a: Double, _ b: Double) -> Double {
        return calculator.multiply(a, b)
    }
    
    public func divide(_ a: Double, _ b: Double) -> Double {
        return calculator.divide(a, b)
    }
} 