//
//  NonFatalError-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import Foundation

extension NonFatalError {
    static func unavailableFont(name: String) -> NonFatalError {

        let domain: String = "Font Style Unavailable - \(name)"
        let code: Int = 100
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: "The app could not load the requested font: \(name)."
        ]
        return NonFatalError(domain: domain, code: code, userInfo: userInfo)
    }
}
