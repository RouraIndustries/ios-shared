//
//  ShadowProperties.swift
//  
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

/// An internal interface for our shadow properties.
///
/// This allows us to ensure that both `Shadow` and `Shadow.Components` will always conform to the same spec, and
/// reference both generically in testing using a common set of KeyPaths.
internal protocol ShadowProperties {

    /// The total `CGSize` of the offset to provide to `layer.shadowOffset`.
    var offset: CGSize { get }

    /// The `width` of the offset to provide to `layer.shadowOffset`.
    var xOffset: CGFloat { get }

    /// The `height` of the offset to provide to `layer.shadowOffset`.
    var yOffset: CGFloat { get }

    /// Exactly half of the `blur` (diameter of the shadow) to apply to `shadowRadius`. All `Shadow` styles are
    /// represented in `blur` to more closely align with the values Figma displays in its view inspector.
    var radius: CGFloat { get }

    /// The `blur` value as displayed in Figma.
    var blur: CGFloat { get }

    /// The `CGColor` to provide to `layer.shadowColor`.
    var cgColor: CGColor { get }

    /// The `opacity` to provide to `layer.shadowOpacity`. Within our current design system, transparency is controlled
    /// exclusively through the `UIColor` alpha, causing this property to be effectively ignored by always setting it
    /// to `1.0`.
    var opacity: Float { get }

    /// A string interpretation of the `Components` for purposes of displaying their details in Tupperware.
    var description: String { get }
}
