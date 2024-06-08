//
//  Numbers-Ext.swift
//  
//
//  Created by Christopher J. Roura on 6/7/24.
//

import Foundation

// MARK: - LimitedNumeric

/// A protocol that extends `Numeric` and `Comparable` to include a method for limiting values to a specified range.
public protocol LimitedNumeric: Numeric, Comparable {

    /// Returns a value limited to the specified range.
    ///
    /// If the value is greater than the upper bound of the range, the upper bound is returned.
    /// If the value is less than the lower bound of the range, the lower bound is returned.
    /// Otherwise, the value itself is returned.
    ///
    /// - Parameter range: The range to which the value should be limited.
    /// - Returns: The value limited to the specified range.
    ///
    /// # Usage
    /// ```
    /// let value: Int = 10
    /// let limitedValue = value.limitingTo(range: 0...5) // limitedValue will be 5
    /// ```
    func limitingTo(range: ClosedRange<Self>) -> Self
}

// MARK: - Default Implementation

public extension LimitedNumeric {

    /// Provides a default implementation for limiting values to a specified range.
    ///
    /// - Parameter range: The range to which the value should be limited.
    /// - Returns: The value limited to the specified range.
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

// Conform `Int`, `Double`, and `Float` to `LimitedNumeric`
extension Int: LimitedNumeric {}
extension Double: LimitedNumeric {}
extension Float: LimitedNumeric {}
