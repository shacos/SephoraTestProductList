//
//  LoggerProtocol.swift
//  Sephora-Common
//
//  Created by Mehdi on 13/1/2026.
//

import Foundation

public protocol CustomLoggerProtocol {
    func verbose(_ message: String, _ file: String, _ function: String, line: Int)
    func debug(_ message: String, _ file: String, _ function: String, line: Int)
    func info(_ message: String, _ file: String, _ function: String, line: Int)
    func warning(_ message: String, _ file: String, _ function: String, line: Int)
    func error(_ message: String, _ file: String, _ function: String, line: Int)
}

public extension CustomLoggerProtocol {
    func verbose(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        verbose(message, file, function, line: line)
    }

    func debug(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        debug(message, file, function, line: line)
    }

    func info(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        info(message, file, function, line: line)
    }

    func warning(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        warning(message, file, function, line: line)
    }

    func error(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        error(message, file, function, line: line)
    }
}
