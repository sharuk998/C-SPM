#pragma once
#include <cmath>  // External C++ standard library

class Calculator {
public:
    Calculator();
    
    // Basic operations
    int add(int a, int b);
    int subtract(int a, int b);
    double multiply(double a, double b);
    double divide(double a, double b);
    
    // Advanced operations using external math library
    double power(double base, double exponent) {
        return std::pow(base, exponent);
    }
    
    double squareRoot(double value) {
        return std::sqrt(value);
    }
    
    double sine(double angle) {
        return std::sin(angle);
    }
}; 
