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
        let baseFont = Font.font(with: fontStyle.components(for: fontFamily), useScaledFont: useScaledFont)
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

        let baseFont = Font.font(with: fontStyle.components(for: fontFamily), useScaledFont: useScaledFont)
        let appliedFont = option?.apply(to: baseFont) ?? baseFont
        return font(appliedFont)
    }
}

public extension Font {

    /// This is the  method you will use to get any standard font defined by a `RouraFontStyle`.  Use this method for all "standard" font styles.  If the calling
    /// app contains a one-off custom font style, you can manually create the `FontComponents` and use the other `font(with:useScaledFont:)`
    /// method.
    /// - Parameters:
    ///   - style: The `RouraFontStyle` for the font you wish to retrieve.  The style inherently specifies the font weight, standard size and scaling style.
    ///   - fontFamily: The `RouraFontFamily` you are using.  This defaults to `montserrat` if not explicitly specified.
    ///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
    ///   on the user's Dynamic Type font settings.
    /// - Returns: A font reflecting the given parameters
    static func font(style: RouraFontStyle,
                     fontFamily: RouraFontFamily = .montserrat,
                     useScaledFont: Bool = true) -> Font {

        if !didRegisterCutomFonts {
            registerCustomFonts()
        }

        let components = style.components(for: fontFamily)
        return font(with: components, useScaledFont: useScaledFont)
    }

    /// Use this method if you have a one-off font style defined in the calling app.  This method allows you to create your own `FontComponents` structure to
    /// define the properties you want in the returned font.  For all standard Roura font styles, use `font(style:fontFmaily:useScaledFont:)` instead.
    /// - Parameters:
    ///   - components: The `FontComponents` that define the font you want returned
    ///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
    ///   on the user's Dynamic Type font settings.
    /// - Returns: A font reflecting the given parameters
    static func font(with components: FontComponents, useScaledFont: Bool) -> Font {
        let fontName = components.fontName.rawValue
        return Font.custom(fontName, size: components.pointSize, relativeTo: components.swiftUITextStyle)
    }
}

// MARK: - Helper Methods

private extension Font {
    static var didRegisterCutomFonts: Bool = false

    /// This method must be called before you can use any non-system / custom font returned by any of the public `font()` methods.  Specifically, this means
    /// if you are using `monterrat`, you must call this method first (`avenir` is supplied by the OS).
    static func registerCustomFonts() {
        let fontsRequiringRegistration = RouraFontName.allCases.filter { $0.requiresRegistration }
        for font in fontsRequiringRegistration {
            guard let url = Bundle.main.url(forResource: font.rawValue, withExtension: "ttf") else {
                Log.nonfatal(.unavailableFont(name: font.rawValue))
                continue
            }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }

        didRegisterCutomFonts = true
    }
}

/// `RouraFontStyle` extension to define Font.TextStyle for SwiftUI
public extension RouraFontStyle {
    /// Maps the given `RouraFontStyle` to `Font.TextStyle` (which is primarily used to describe how the font will scale with dynamic type)
    private var swiftUITextStyle: Font.TextStyle {
        switch self {
        case .h2: return .title2
        case .h3: return .title3
        case .h4: return .headline
        case .h5: return .subheadline
        case .h5Light: return .subheadline
        case .h5Bold: return .subheadline
        case .body: return .body
        case .bodyBold: return .body
        case .caption: return .caption
        case .captionBold: return .caption
        case .captionExtraBold: return .caption
        case .tiny: return .caption2
        }
    }
}
