//
//  UIColorComponent.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

public struct UIColorComponent: ExpressibleByIntegerLiteral, CVarArg {
    // Properties
    let rawValue: CGFloat
    private let intValue: Int

    // CVarArg
    // - Allows for printing as an Int using String(format: "%i", arg)
    public var _cVarArgEncoding: [Int] {
        [intValue]
    }

    // ExpressibleByIntegerLiteral
    public init(integerLiteral value: IntegerLiteralType) {
        let limitedValue = value.limitingTo(range: 0 ... 255)
        intValue = limitedValue
        rawValue = CGFloat(limitedValue) / 255.0
    }
}
