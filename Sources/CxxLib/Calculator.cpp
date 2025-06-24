#include "include/Calculator.hpp"

Calculator::Calculator() = default;

int Calculator::add(int a, int b) {
    return a + b;
}

int Calculator::subtract(int a, int b) {
    return a - b;
}

double Calculator::multiply(double a, double b) {
    return a * b;
}

double Calculator::divide(double a, double b) {
    if (b == 0) {
        return 0.0; // Simple error handling
    }
    return a / b;
} 
