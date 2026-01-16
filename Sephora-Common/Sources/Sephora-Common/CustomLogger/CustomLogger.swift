//
//  LoggerSwifty.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation
import SwiftyBeaver

public struct CustomLogger: CustomLoggerProtocol {
    private let logger = SwiftyBeaver.self

    public init() {
        let console = ConsoleDestination()
        logger.addDestination(console)
    }

    public func verbose(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        logger.verbose(message, file: file, function: function, line: line) // prio 1, VERBOSE in silver
    }

    public func debug(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        logger.debug(message, file: file, function: function, line: line) // prio 2, DEBUG in green
    }

    public func info(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        logger.info(message, file: file, function: function, line: line) // prio 3, INFO in blue
    }

    public func warning(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        logger.warning(message, file: file, function: function, line: line) // prio 4, WARNING in yellow
    }

    public func error(_ message: String, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        logger.error(message, file: file, function: function, line: line) // prio 5, ERROR in red
    }
}

