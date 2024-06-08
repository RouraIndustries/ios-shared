//
//  UIView-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

// MARK: - Apply Shadow
public extension UIView {

    /// Apply a shadow to the view using one of our pre-defined Design System `Shadow` styles
    /// - Parameters:
    ///    - shadow: The predefined `Shadow` style to apply.
    func applyShadow(_ shadow: Shadow) {
        shadowComponents = shadow.components
    }

    /// Apply a shadow using custom properties.
    ///
    /// NOTE: This method should be used sparingly, and only when absolutely needed. Most shadows should be able to
    /// use a pre-defined `Shadow` style until we're able to get to a point where we have a preset for all use cases.
    /// - Parameters:
    ///   - xOffset: The horizontal offset of the shadow.
    ///   - yOffset: The vertical offset of the shadow.
    ///   - blur: The blur radius of the shadow.
    ///   - color: The color of the shadow.
    /// - Returns: A view with the custom shadow applied.
    func applyShadow(xOffset: CGFloat, yOffset: CGFloat, blur: CGFloat, color: UIColor) {
        
        shadowComponents = Shadow.Components(
            xOffset: xOffset,
            yOffset: yOffset,
            blur: blur,
            color: color
        )
    }

    /// Reset all shadow properties to their defaults.
    func removeShadow() {
        shadowComponents = nil
    }
}

// MARK: - Shadow Property
internal extension UIView {

    /// A property for reading and applying `Shadow.Components` to and from the underlying `UIView`.
    ///
    /// NOTE: This property has been kept internal to the library since the apps are primarily concerned with setting
    /// values as opposed to reading them. Providing a getter here simply makes unit testing slightly easier.
    var shadowComponents: Shadow.Components? {
        get {
            return Shadow.Components(view: self)
        }
        set {
            layer.shadowOffset = newValue?.offset ?? .zero
            layer.shadowColor = newValue?.cgColor ?? UIColor.clear.cgColor
            layer.shadowRadius = newValue?.radius ?? .zero
            layer.shadowOpacity = newValue?.opacity ?? .zero
        }
    }
}
