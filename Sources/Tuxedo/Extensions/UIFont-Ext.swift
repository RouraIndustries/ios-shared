//
//  UIFont-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import RouraFoundation
import UIKit

public extension UIFont {

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
        useScaledFont: Bool = true
    ) -> UIFont {
        
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
    static func font(with components: FontComponents, useScaledFont: Bool) -> UIFont {
        if !didRegisterCutomFonts {
            registerCustomFonts()
        }

        let fontName = components.fontName.rawValue

        let font: UIFont
        if let rouraFont = UIFont(name: fontName, size: components.pointSize) {
            font = rouraFont
        } else {
            Log.nonfatal(.unavailableFont(name: fontName))
            font = UIFont.systemFont(ofSize: components.pointSize)
        }

        return useScaledFont ? UIFontMetrics(forTextStyle: components.textStyle).scaledFont(for: font) : font
    }
}

// MARK: - Helper Methods

private extension UIFont {
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
public enum RouraFontStyle: CaseIterable {
    case h2
    case h3
    case h4
    case h5
    case h5Light
    case h5Bold
    case body
    case bodyBold
    case caption
    case captionBold
    case captionExtraBold
    case tiny

    // MARK: - Descriptors

    public var name: String { String(describing: self) }

    public func description(for family: RouraFontFamily) -> String { "\(fontName(for: family).rawValue) (\(pointSize)pt)" }

    // MARK: - Private Methods

    /// Maps the given `RouraFontStyle` to a `RouraFontName` for a given font family
    /// - Parameter family: The font family that will be used for the give `RouraFontStyle`
    /// - Returns: A `RouraFontName` for the given font style and font family
    private func fontName(for family: RouraFontFamily) -> RouraFontName {
        switch self {
        case .h2:
            switch family {
            case .lexend:       return .lexendBold
            case .montserrat:   return .montserratExtraBold
            }
        case .h3:
            switch family {
            case .lexend:       return .lexendBold
            case .montserrat:   return .montserratExtraBold
            }
        case .h4:
            switch family {
            case .lexend:       return .lexendBold
            case .montserrat:   return .montserratExtraBold
            }
        case .h5:
            switch family {
            case .lexend:       return .lexendMedium
            case .montserrat:   return .montserratSemiBold
            }
        case .h5Light:
            switch family {
            case .lexend:       return .lexendExtraLight
            case .montserrat:   return .montserratRegular
            }
        case .h5Bold:
            switch family {
            case .lexend:       return .lexendBold
            case .montserrat:   return .montserratExtraBold
            }
        case .body:
            switch family {
            case .lexend:       return .lexendThin
            case .montserrat:   return .montserratRegular
            }
        case .bodyBold:
            switch family {
            case .lexend:       return .lexendMedium
            case .montserrat:   return .montserratSemiBold
            }
        case .caption:
            switch family {
            case .lexend:       return .lexendThin
            case .montserrat:   return .montserratRegular
            }
        case .captionBold:
            switch family {
            case .lexend:       return .lexendMedium
            case .montserrat:   return .montserratSemiBold
            }
        case .captionExtraBold:
            switch family {
            case .lexend:       return .lexendBold
            case .montserrat:   return .montserratExtraBold
            }
        case .tiny:
            switch family {
            case .lexend:       return .lexendMedium
            case .montserrat:   return .montserratSemiBold
            }
        }
    }

    /// Maps the given `RouraFontStyle` to the appropriate font size
    private var pointSize: CGFloat {
        switch self {
        case .h2:               return 36.0
        case .h3:               return 26.0
        case .h4:               return 20.0
        case .h5:               return 16.0
        case .h5Light:          return 16.0
        case .h5Bold:           return 16.0
        case .body:             return 14.0
        case .bodyBold:         return 14.0
        case .caption:          return 12.0
        case .captionBold:      return 12.0
        case .captionExtraBold: return 12.0
        case .tiny:             return 10.0
        }
    }

    /// Maps the given `RouraFontStyle` to `UIFont.TextStyle` (which is primarily used to describe how the font will scale with dynamic type)
    private var textStyle: UIFont.TextStyle {
        switch self {
        case .h2:               return .title2
        case .h3:               return .title3
        case .h4:               return .headline
        case .h5:               return .subheadline
        case .h5Light:          return .subheadline
        case .h5Bold:           return .subheadline
        case .body:             return .body
        case .bodyBold:         return .body
        case .caption:          return .caption1
        case .captionBold:      return .caption1
        case .captionExtraBold: return .caption1
        case .tiny:             return .caption2
        }
    }

    internal func components(for family: RouraFontFamily) -> FontComponents {
        let fontName = fontName(for: family)
        return FontComponents(fontName: fontName, pointSize: pointSize, textStyle: textStyle)
    }
}
