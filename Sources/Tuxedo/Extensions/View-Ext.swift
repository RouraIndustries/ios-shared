//
//  View-Ext.swift
//  
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

// MARK: - SwiftUI View Extension
public extension View {

    /// Applies a predefined shadow to the view.
    /// - Parameters:
    ///    - shadow: The predefined `Shadow` style to apply.
    /// - Returns: A view with the shadow applied.
    func applyShadow(_ shadow: Shadow) -> some View {
        self.shadow(
            color: Color(shadow.components.cgColor),
            radius: shadow.components.radius,
            x: shadow.components.xOffset,
            y: shadow.components.yOffset
        )
    }

    /// Applies a custom shadow to the view.
    /// - Parameters:
    ///    - xOffset: The horizontal offset of the shadow.
    ///    - yOffset: The vertical offset of the shadow.
    ///    - blur: The blur radius of the shadow.
    ///    - color: The color of the shadow.
    /// - Returns: A view with the custom shadow applied.
    func applyCustomShadow(xOffset: CGFloat, yOffset: CGFloat, blur: CGFloat, color: Color) -> some View {
        self.shadow(
            color: color,
            radius: blur / 2,
            x: xOffset,
            y: yOffset
        )
    }
}

public extension View {
    /// <#Description#>
    /// - Parameters:
    ///   - style: <#style description#>
    ///   - fontFamily: <#fontFamily description#>
    ///   - useScaledFont: <#useScaledFont description#>
    ///   - option: <#option description#>
    /// - Returns: <#description#>
    func tuxedoFont(
        _ style: RouraFontStyle,
        fontFamily: RouraFontFamily = .montserrat,
        useScaledFont: Bool = true,
        option: FontStylingOption? = nil
    ) -> some View {
        self.font(Font.font(style: style, fontFamily: fontFamily, useScaledFont: useScaledFont, option: option))
    }
}
