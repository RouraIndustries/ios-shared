//
//  Log.swift
//
//
//  Created by Christopher J. Roura on 3/28/24.
//

import UIKit
import os.log

public enum Log {
    public enum LogLevel: String {
        case info     = "INFO"
        case warning  = "WARNING"
        case error    = "ERROR"
    }

    private static let subsystem = UIApplication.bundleId

    static func log(_ level: LogLevel, _ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let logMessage = "\(level.rawValue) - [\(file):\(line)] \(function): \(message)"
        os_log("%{public}s", log: OSLog(subsystem: subsystem, category: level.rawValue), type: .default, logMessage)
    }

    static func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.info, message, file: file, function: function, line: line)
    }

    static func warn(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.warning, message, file: file, function: function, line: line)
    }

    static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, message, file: file, function: function, line: line)
    }

    static func nonfatal(_ error: NonFatalError, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, "Non-fatal error: \(error.localizedDescription)", file: file, function: function, line: line)
    }
}
