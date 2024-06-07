//
//  NonFatalError.swift
//
//
//  Created by Christopher J. Roura on 3/13/24.
//

import Foundation

public typealias NonFatalError = NSError

extension NonFatalError {
    static func XCTestNonfatal() -> NonFatalError {
        let desc = "This is a test nonfatal error message (XCTest: -1)"
        return NonFatalError(domain: "XCTest", code: -1, userInfo: [NSLocalizedDescriptionKey: desc])
    }
}
