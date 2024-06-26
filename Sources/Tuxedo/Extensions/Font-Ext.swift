//
//  Font-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import RouraFoundation
import SwiftUI

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
    static func font(
        style: RouraFontStyle,
        fontFamily: RouraFontFamily = .montserrat,
        useScaledFont: Bool = true,
        option: FontStylingOption? = nil
    ) -> Font {

        let components = style.components(for: fontFamily)
        return font(with: components, useScaledFont: useScaledFont, option: option)
    }

    /// Use this method if you have a one-off font style defined in the calling app.  This method allows you to create your own `FontComponents` structure to
    /// define the properties you want in the returned font.  For all standard Roura font styles, use `font(style:fontFmaily:useScaledFont:)` instead.
    /// - Parameters:
    ///   - components: The `FontComponents` that define the font you want returned
    ///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
    ///   on the user's Dynamic Type font settings.
    /// - Returns: A font reflecting the given parameters
    static func font(
        with components: FontComponents,
        useScaledFont: Bool,
        option: FontStylingOption? = nil
    ) -> Font {

        if !didRegisterCutomFonts {
            registerCustomFonts()
        }

        let fontName = components.fontName.rawValue
        let fontSize = components.pointSize

        let baseFont = useScaledFont ?
        Font.custom(fontName, size: fontSize, relativeTo: components.swiftUITextStyle) :
        Font.custom(fontName, fixedSize: fontSize)

        return option?.apply(to: baseFont) ?? baseFont
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
            guard let url = Bundle.module.url(forResource: font.rawValue, withExtension: "ttf") else {
                Log.nonfatal(.unavailableFont(name: font.rawValue))
                continue
            }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }

        didRegisterCutomFonts = true
    }
}

/// `RouraFontStyle` serves to define all our Roura fonts expressed in terms of `FontComponents`.  This allows us to have a single definition that can be shared
/// between UIKit and SwiftUI
extension RouraFontStyle {
    var swiftUItextStyle: Font.TextStyle {
        switch self {
        case .h2:               return .title2
        case .h3:               return .title3
        case .h4:               return .headline
        case .h5:               return .subheadline
        case .h5Light:          return .subheadline
        case .h5Bold:           return .subheadline
        case .body:             return .body
        case .bodyBold:         return .body
        case .caption:          return .caption
        case .captionBold:      return .caption
        case .captionExtraBold: return .caption
        case .tiny:             return .caption2
        }
    }
}
