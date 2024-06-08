//
//  Font-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

/// Extension for applying Roura fonts to SwiftUI views.
public extension Font {

    /**
     Returns a Roura font with the specified style.

     - Parameters:
     - fontStyle: The style of the Roura font.
     - fontFamily: The family of the Roura font (default: Montserrat).
     - useScaledFont: Whether to use the scaled font (default: true).
     - Returns: A `Font` object corresponding to the specified Roura font style.

     - Note: Due to naming collisions between Roura font styles and SwiftUI.Font (e.g., `Font.caption`), we access custom fonts through this method instead of defining them via static vars. Static var overrides may cause errors when rendering Previews.
     */
    static func rouraFont(_ fontStyle: RouraFontStyle, fontFamily: RouraFontFamily = .montserrat, useScaledFont: Bool = true) -> Font {
        if !didRegisterCutomFonts {
            registerCustomFonts()
        }

        return Font(UIFont.font(style: fontStyle, fontFamily: fontFamily, useScaledFont: useScaledFont))
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
        let baseFont = Font.rouraFont(fontStyle, fontFamily: fontFamily, useScaledFont: useScaledFont)
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
        let baseFont = Font.rouraFont(fontStyle, fontFamily: fontFamily, useScaledFont: useScaledFont)
        let appliedFont = option?.apply(to: baseFont) ?? baseFont
        return font(appliedFont)
    }
}
