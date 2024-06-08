//
//  ShadowComponent.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

/// An enum representing pre-defined Design System `Shadow` styles.
public enum Shadow {

    /// x: 0, y: 1, blur: 4
    case low

    /// x: 0, y: 2, blur: 8
    case medium

    /// x: 0, y: 4, blur: 16
    case high

    /// x: 0, y: 8, blur: 32
    case extraHigh

    /// The lower level building blocks of our `Shadow` configuration.
    internal var components: Components {
        switch self {
        case .low:              return Components(xOffset: 0.0, yOffset: 1.0, blur: 4.0, color: .shadow)
        case .medium:           return Components(xOffset: 0.0, yOffset: 2.0, blur: 8.0, color: .shadow)
        case .high:             return Components(xOffset: 0.0, yOffset: 4.0, blur: 16.0, color: .shadow)
        case .extraHigh:        return Components(xOffset: 0.0, yOffset: 8.0, blur: 32.0, color: .shadow)
        }
    }
}

// MARK: - Passthrough Properties
extension Shadow: ShadowProperties {

    internal var offset: CGSize { components.offset }
    internal var xOffset: CGFloat { components.xOffset }
    internal var yOffset: CGFloat { components.yOffset }
    internal var radius: CGFloat { components.radius }
    internal var blur: CGFloat { components.blur }
    internal var cgColor: CGColor { components.cgColor }
    internal var opacity: Float { components.opacity }
    internal var description: String { components.description }
}
