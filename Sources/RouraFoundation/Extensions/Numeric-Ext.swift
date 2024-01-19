//
//  Numeric-Ext.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import Foundation

// MARK: - LimitedNumeric
public protocol LimitedNumeric: Numeric, Comparable {
    func limitingTo(range: ClosedRange<Self>) -> Self
}

// MARK: - Default Implementation
public extension LimitedNumeric {
    func limitingTo(range: ClosedRange<Self>) -> Self {
        if self > range.upperBound {
            return range.upperBound
        } else if self < range.lowerBound {
            return range.lowerBound
        } else {
            return self
        }
    }
}

// MARK: - Primitive Type Conformance
extension Int: LimitedNumeric {}
extension Double: LimitedNumeric {}
extension Float: LimitedNumeric {}
