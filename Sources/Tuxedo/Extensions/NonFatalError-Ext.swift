//
//  NonFatalError-Ext.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import Foundation
import UIKit
import RouraFoundation

public extension NonFatalError {
    static func couldNotSolveLineSpacingQuadraticEquation(for font: UIFont) -> NonFatalError {
        let domain: String = "Could not determine line spacing"
        let code: Int = -1
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: "Could not determine line spacing - solveQuadratic returned null",
            "fontName": font.fontName,
            "fontPointSize": font.pointSize,
            "fontLineHeight": font.lineHeight
        ]

        return NonFatalError(domain: domain, code: code, userInfo: userInfo)
    }

    static func unavailableFont(name: String) -> NonFatalError {
        let domain: String = "Font Style Unavailable - \(name)"
        let code: Int = 100
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: "The app could not load the requested font: \(name)."
        ]

        return NonFatalError(domain: domain, code: code, userInfo: userInfo)
    }
}
