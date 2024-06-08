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

        let baseFont: Font

        switch fontStyle {
        case .h2: baseFont = Font.tuxedoH2
        case .h3: baseFont = Font.tuxedoH3
        case .h4: baseFont = Font.tuxedoH4
        case .h5: baseFont = Font.tuxedoH5
        case .h5Light: baseFont = Font.tuxedoH5Light
        case .h5Bold: baseFont = Font.tuxedoH5Bold
        case .body: baseFont = Font.tuxedoBody
        case .bodyBold: baseFont = Font.tuxedoBodyBold
        case .caption: baseFont = Font.tuxedoCaption
        case .captionBold: baseFont = Font.tuxedoCaptionBold
        case .captionExtraBold: baseFont = Font.tuxedoCaptionExtraBold
        case .tiny: baseFont = Font.tuxedoTiny
        }

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

        let baseFont: Font

        switch fontStyle {
        case .h2: baseFont = Font.tuxedoH2
        case .h3: baseFont = Font.tuxedoH3
        case .h4: baseFont = Font.tuxedoH4
        case .h5: baseFont = Font.tuxedoH5
        case .h5Light: baseFont = Font.tuxedoH5Light
        case .h5Bold: baseFont = Font.tuxedoH5Bold
        case .body: baseFont = Font.tuxedoBody
        case .bodyBold: baseFont = Font.tuxedoBodyBold
        case .caption: baseFont = Font.tuxedoCaption
        case .captionBold: baseFont = Font.tuxedoCaptionBold
        case .captionExtraBold: baseFont = Font.tuxedoCaptionExtraBold
        case .tiny: baseFont = Font.tuxedoTiny
        }

        let appliedFont = option?.apply(to: baseFont) ?? baseFont
        return font(appliedFont)
    }
}

import SwiftUI

extension Font.TextStyle {

    /// Create a Font.TextStyle that maps to the closest correpsonding UIFont.TextStyle
    /// - Parameter style: The UIFont.TextStyle that you need a corresponding Font.TextStyle for.
    init(with style: UIFont.TextStyle) {
        switch style {
        case .largeTitle:
            self = .largeTitle
        case .title1:
            self = .title
        case .title2:
            if #available(iOS 14.0, *) {
                self = .title2
            } else {
                self = .title
            }
        case .title3:
            if #available(iOS 14.0, *) {
                self = .title3
            } else {
                self = .title
            }
        case .headline:
            self = .headline
        case .subheadline:
            self = .subheadline
        case .callout:
            self = .callout
        case .caption1:
            self = .caption
        case .caption2:
            if #available(iOS 14.0, *) {
                self = .caption2
            } else {
                self = .caption
            }
        case .footnote:
            self = .footnote
        case .body:
            self = .body

        default:
            self = .body
        }
    }
}

// MARK: - Tuxedo Fonts
extension Font {

    /**
     * Returns a Font provided by the Tuxedo font library.
     *
     * NOTE: Due to naming collisions between our Tuxedo font styles and that of SwiftUI.Font (Font.caption for ex.),
     * we explicitly access our custom fonts through this method instead of defining them as we do in other places via
     * the use of static vars. Providing static var overrides currently causes errors when rendering Previews that use
     * the overrides.
     */
    static func tuxedo(_ fontStyle: RouraFontStyle) -> Font {
        return Font(UIFont.font(style: fontStyle))
    }
}


extension Font {

    /// Returns a font for the given components that will properly scale for it's font text style
    /// - Parameter components: The `FontComponents` to build a font from
    /// - Returns: A scalable font from the given components
    private static func font(for components: FontComponents) -> Font {
        if #available(iOS 14.0, *) {
            return Font.custom(components.fontName.rawValue,
                               size: components.pointSize,
                               relativeTo: Font.TextStyle(with: components.textStyle))
        } else {
            return Font.custom(components.fontName.rawValue, size: components.pointSize)
        }
    }

    /// It should be relatively rare that you use this method - in general, you should use `font(for:)` instead.
    /// This method will return a font that does _not_ scale with dynamic type sizes
    /// - Parameter components: The `FontComponents` to build a font from
    /// - Returns: A fixed-sized font from the given components
    private static func fixedSizedFont(for components: FontComponents) -> Font {
        if #available(iOS 14.0, *) {
            return Font.custom(components.fontName.rawValue, fixedSize: components.pointSize)
        } else {
            return Font.custom(components.fontName.rawValue, size: components.pointSize)
        }
    }
}

public extension Font {
    static let tuxedoTiny: Font = font(for: RouraFontStyle.tiny.components(for: .montserrat))
    static let tuxedoCaption: Font = font(for: RouraFontStyle.caption.components(for: .montserrat))
    static let tuxedoCaptionBold: Font = font(for: RouraFontStyle.captionBold.components(for: .montserrat))
    static let tuxedoCaptionExtraBold: Font = font(for: RouraFontStyle.captionExtraBold.components(for: .montserrat))
    static let tuxedoBody: Font = font(for: RouraFontStyle.body.components(for: .montserrat))
    static let tuxedoBodyBold: Font = font(for: RouraFontStyle.bodyBold.components(for: .montserrat))
    static let tuxedoH2: Font = font(for: RouraFontStyle.h2.components(for: .montserrat))
    static let tuxedoH3: Font = font(for: RouraFontStyle.h3.components(for: .montserrat))
    static let tuxedoH4: Font = font(for: RouraFontStyle.h4.components(for: .montserrat))
    static let tuxedoH5: Font = font(for: RouraFontStyle.h5.components(for: .montserrat))
    static let tuxedoH5Light: Font = font(for: RouraFontStyle.h5Light.components(for: .montserrat))
    static let tuxedoH5Bold: Font = font(for: RouraFontStyle.h5Bold.components(for: .montserrat))
}
