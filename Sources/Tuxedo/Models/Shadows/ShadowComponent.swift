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

    /// Neumorphic shadow effect for the top portion of the component.
    /// x: -4, y: -4, blur: 8, color: Shadow.opacity(0.35)
    case neumorphicTop(isPressed: Bool)

    /// Neumorphic shadow effect for the bottom portion of the component.
    /// x: 8, y: 8, blur: 16, color: .backgroundPrimary
    case neumorphicBottom(isPressed: Bool)

    /// The lower level building blocks of our `Shadow` configuration.
    internal var components: Components {
        switch self {
        case .low:              return Components(xOffset: 0.0, yOffset: 1.0, blur: 4.0, color: .shadow)
        case .medium:           return Components(xOffset: 0.0, yOffset: 2.0, blur: 8.0, color: .shadow)
        case .high:             return Components(xOffset: 0.0, yOffset: 4.0, blur: 16.0, color: .shadow)
        case .extraHigh:        return Components(xOffset: 0.0, yOffset: 8.0, blur: 32.0, color: .shadow)
        case .neumorphicTop(let isPressed):
            return Components(
                xOffset: isPressed ? -4.0 : 8.0,
                yOffset: isPressed ? -4.0 : 8.0,
                blur: isPressed ? 8.0 : 16.0,
                color: .shadow.withAlphaComponent(isPressed ? 0.35 : 0.75)
            )

        case .neumorphicBottom(let isPressed): 
            return Components(
                xOffset: isPressed ? 8.0 : -4.0,
                yOffset: isPressed ? 8.0 : -4.0,
                blur: isPressed ? 8.0 : 16.0,
                color: .backgroundPrimary
            )
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
