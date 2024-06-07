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
    func applyShadow(_ shadow: Shadow) {
        shadowComponents = shadow.components
    }

    /// Apply a shadow using custom properties.
    ///
    /// > NOTE: This method should be used sparingly, and only when absolutely needed. Most shadows should be able to
    /// use a pre-defined `Shadow` style until we're able to get to a point where we have a preset for all use cases.
    ///
    /// - Parameters:
    ///   - xOffset: The horizontal offset to apply to the shadow.
    ///   - yOffset: The vertical offset to apply to the shadow.
    ///   - blur: The diameter of the shadow. This value should match 1:1 with what is displayed in Figma, and will be
    ///   cut in half when rendering through `shadowRadius`.
    ///   - color: A `UIColor` to derive `CGColor` from to apply to the `shadowColor`.
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
