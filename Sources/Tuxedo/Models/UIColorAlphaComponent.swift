//
//  UIColorAlphaComponent.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

public struct UIColorAlphaComponent: ExpressibleByFloatLiteral, Equatable {
    // Properties
    let rawValue: CGFloat

    // ExpressibleByFloatLiteral
    public init(floatLiteral value: FloatLiteralType) {
        let limitedValue = value.limitingTo(range: 0.0 ... 1.0)
        rawValue = CGFloat(limitedValue)
    }
}
