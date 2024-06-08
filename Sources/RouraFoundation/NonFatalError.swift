//
//  NonFatalError.swift
//
//
//  Created by Christopher J. Roura on 3/13/24.
//

import Foundation

/// A typealias for `NSError` used to represent non-fatal errors in the application.
public typealias NonFatalError = NSError

extension NonFatalError {
    
    /// Creates and returns a non-fatal error specific to XCTest.
    ///
    /// - Returns: A `NonFatalError` with a domain of "XCTest", a code of -1, and a localized description
    ///   indicating it is a test non-fatal error message.
    ///
    /// # Usage
    /// ```
    /// let error = NonFatalError.XCTestNonfatal()
    /// print(error.localizedDescription)  // "This is a test nonfatal error message (XCTest: -1)"
    /// ```
    ///
    /// This method is particularly useful for unit testing scenarios where you need to simulate or verify
    /// error handling behavior without triggering actual failures.
    ///
    /// # Example
    /// ```
    /// func testExample() {
    ///     let error = NonFatalError.XCTestNonfatal()
    ///     XCTAssertEqual(error.domain, "XCTest")
    ///     XCTAssertEqual(error.code, -1)
    ///     XCTAssertEqual(error.localizedDescription, "This is a test nonfatal error message (XCTest: -1)")
    /// }
    /// ```
    static func XCTestNonfatal() -> NonFatalError {
        let desc = "This is a test nonfatal error message (XCTest: -1)"
        return NonFatalError(domain: "XCTest", code: -1, userInfo: [NSLocalizedDescriptionKey: desc])
    }
}
