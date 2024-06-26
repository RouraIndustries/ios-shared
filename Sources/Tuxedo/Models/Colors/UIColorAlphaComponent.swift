//
//  UIColorAlphaComponent.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import Foundation
import RouraFoundation

public struct UIColorAlphaComponent: ExpressibleByFloatLiteral, Equatable {

    // Properties
    let rawValue: CGFloat

    // ExpressibleByFloatLiteral
    public init(floatLiteral value: FloatLiteralType) {

        let limitedValue = value.limitingTo(range: 0.0...1.0)
        rawValue = CGFloat(limitedValue)
    }
}
