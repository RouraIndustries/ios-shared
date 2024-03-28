//
//  NonFatalError-Ext.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit
import RouraFoundation

public extension NonFatalError {
    static func unavailableFont(name: String) -> NonFatalError {
        let domain: String = "Font Style Unavailable - \(name)"
        let code: Int = 100
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: "The app could not load the requested font: \(name)."
        ]

        return NonFatalError(domain: domain, code: code, userInfo: userInfo)
    }
}
