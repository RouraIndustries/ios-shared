//
//  Log.swift
//
//
//  Created by Christopher J. Roura on 3/28/24.
//

import UIKit
import os.log

/// A utility for logging messages with various severity levels.
public enum Log {

    /// Represents different levels of log severity.
    public enum LogLevel: String {

        /// Informational messages.
        case info     = "INFO"

        /// Warning messages indicating potential issues.
        case warning  = "WARNING"

        /// Error messages indicating serious issues.
        case error    = "ERROR"
    }

    /// The subsystem identifier used for logging.
    /// This should typically be set to your application's bundle identifier.
    private static let subsystem = UIApplication.bundleId

    /// Logs a message with a specified severity level.
    ///
    /// - Parameters:
    ///   - level: The severity level of the log message (info, warning, or error).
    ///   - message: The message to be logged.
    ///   - file: The name of the file from which the log is sent. Defaults to the file name where the function is called.
    ///   - function: The name of the function from which the log is sent. Defaults to the function name where the log is called.
    ///   - line: The line number from which the log is sent. Defaults to the line number where the log is called.
    public static func log(_ level: LogLevel, _ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let logMessage = "\(level.rawValue) - [\(file):\(line)] \(function): \(message)"
        os_log("%{public}s", log: OSLog(subsystem: subsystem, category: level.rawValue), type: .default, logMessage)
    }

    /// Logs an informational message.
    ///
    /// - Parameters:
    ///   - message: The informational message to be logged.
    ///   - file: The name of the file from which the log is sent. Defaults to the file name where the function is called.
    ///   - function: The name of the function from which the log is sent. Defaults to the function name where the log is called.
    ///   - line: The line number from which the log is sent. Defaults to the line number where the log is called.
    public static func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.info, message, file: file, function: function, line: line)
    }

    /// Logs a warning message.
    ///
    /// - Parameters:
    ///   - message: The warning message to be logged.
    ///   - file: The name of the file from which the log is sent. Defaults to the file name where the function is called.
    ///   - function: The name of the function from which the log is sent. Defaults to the function name where the log is called.
    ///   - line: The line number from which the log is sent. Defaults to the line number where the log is called.
    public static func warn(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.warning, message, file: file, function: function, line: line)
    }

    /// Logs an error message.
    ///
    /// - Parameters:
    ///   - message: The error message to be logged.
    ///   - file: The name of the file from which the log is sent. Defaults to the file name where the function is called.
    ///   - function: The name of the function from which the log is sent. Defaults to the function name where the log is called.
    ///   - line: The line number from which the log is sent. Defaults to the line number where the log is called.
    public static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, message, file: file, function: function, line: line)
    }

    /// Logs a non-fatal error.
    ///
    /// - Parameters:
    ///   - error: The non-fatal error to be logged.
    ///   - file: The name of the file from which the log is sent. Defaults to the file name where the function is called.
    ///   - function: The name of the function from which the log is sent. Defaults to the function name where the log is called.
    ///   - line: The line number from which the log is sent. Defaults to the line number where the log is called.
    public static func nonfatal(_ error: NonFatalError, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, "Non-fatal error: \(error.localizedDescription)", file: file, function: function, line: line)
    }
}
