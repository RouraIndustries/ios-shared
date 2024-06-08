//
//  Font-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

/// Enumeration of font style options that can be applied to Roura fonts.
public enum FontOption {
    /// Small caps variant of the font.
    case smallCaps

    /// Lowercase small caps variant of the font.
    case lowercaseSmallCaps

    /// Uppercase small caps variant of the font.
    case uppercaseCaps

    /// Italic variant of the font.
    case italic

    /// Bold variant of the font.
    case bold

    /**
     Applies the font option to a given `Font`.

     - Parameters:
        - font: The original `Font` object.
     - Returns: A `Font` object with the specified option applied.
     */
    func apply(to font: Font) -> Font {
        switch self {
        case .smallCaps: return font.smallCaps()
        case .lowercaseSmallCaps: return font.lowercaseSmallCaps()
        case .uppercaseCaps: return font.uppercaseSmallCaps()
        case .italic: return font.italic()
        case .bold: return font.bold()
        }
    }
}

/// Extension for applying Roura fonts to SwiftUI views.
public extension View {

    /**
     Applies a Roura font to the view.

     - Parameters:
        - fontStyle: The Roura font style to be used.
        - fontFamily: The Roura font family (default: Montserrat).
        - useScaledFont: Whether to use the scaled font (default: true).
        - option: An optional `FontOption` to modify the font style.
     - Returns: A view with the specified Roura font and style option applied.
     */
    func rouraFont(_ fontStyle: RouraFontStyle, fontFamily: RouraFontFamily = .montserrat, useScaledFont: Bool = true, option: FontOption? = nil) -> some View {
        let baseFont = Font.font(for: fontStyle.components(for: fontFamily), useScaledFont: useScaledFont)
        let appliedFont = option?.apply(to: baseFont) ?? baseFont
        return font(appliedFont)
    }
}

/// Extension for applying Roura fonts to SwiftUI Text views.
public extension Text {

    /**
     Applies a Roura font to the text.

     - Parameters:
        - fontStyle: The Roura font style to be used.
        - fontFamily: The Roura font family (default: Montserrat).
        - useScaledFont: Whether to use the scaled font (default: true).
        - option: An optional `FontOption` to modify the font style.
     - Returns: A text view with the specified Roura font and style option applied.
     */
    func rouraFont(_ fontStyle: RouraFontStyle, fontFamily: RouraFontFamily = .montserrat, useScaledFont: Bool = true, option: FontOption? = nil) -> Text {

        let baseFont = Font.font(for: fontStyle.components(for: fontFamily), useScaledFont: useScaledFont)
        let appliedFont = option?.apply(to: baseFont) ?? baseFont
        return font(appliedFont)
    }
}

extension Font.TextStyle {

    /// Create a Font.TextStyle that maps to the closest correpsonding UIFont.TextStyle
    /// - Parameter style: The UIFont.TextStyle that you need a corresponding Font.TextStyle for.
    init(with style: UIFont.TextStyle) {
        switch style {
        case .largeTitle: self = .largeTitle
        case .title1: self = .title
        case .title2: self = .title2
        case .title3: self = .title3
        case .headline: self = .headline
        case .subheadline: self = .subheadline
        case .callout: self = .callout
        case .caption1: self = .caption
        case .caption2: self = .caption2
        case .footnote: self = .footnote
        case .body: self = .body
        default: self = .body
        }
    }
}

extension Font {

    /// Returns a font for the given components that will properly scale for it's font text style
    /// - Parameter components: The `FontComponents` to build a font from
    /// - Returns: A scalable font from the given components
    static func font(for components: FontComponents, useScaledFont: Bool = true) -> Font {
        if useScaledFont {
            return Font.custom(components.fontName.rawValue,
                        size: components.pointSize,
                        relativeTo: Font.TextStyle(with: components.textStyle))
        } else {
            return Font.custom(components.fontName.rawValue, fixedSize: components.pointSize)
        }
    }
}
