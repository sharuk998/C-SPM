// The Swift Programming Language
// https://docs.swift.org/swift-book

import CxxLib
import CxxStdlib

extension String {
    var stdString: std.string {
        std.string(self)
    }
}
