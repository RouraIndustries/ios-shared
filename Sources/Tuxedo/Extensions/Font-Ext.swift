//
//  SwiftUIView.swift
//
//
//  Created by Christopher J. Roura on 3/13/24.
//

import SwiftUI

public enum FontOption {
    case small
    case lowercaseSmallCaps
    case uppercaseCaps
    case italic
}

public extension View {
    func tuxedoFont(_ style: TuxedoFontStyle, fontFamily: TuxedoFontFamily = .montserrat, useScaledFonts: Bool = true, option: FontOption? = nil) -> some View {
        self.font(.tuxedoFont(style, fontFamily: fontFamily, useScaledFonts: useScaledFonts, option: option))
    }
}

public extension Text {
    func tuxedoFont(_ style: TuxedoFontStyle, fontFamily: TuxedoFontFamily = .montserrat, useScaledFonts: Bool = true, option: FontOption? = nil) -> Text {
        self.font(.tuxedoFont(style, fontFamily: fontFamily, useScaledFonts: useScaledFonts, option: option))
    }
}

public extension Font {
    static func tuxedoFont(_ style: TuxedoFontStyle, fontFamily: TuxedoFontFamily = .montserrat, useScaledFonts: Bool = true, option: FontOption? = nil) -> Font {
        if !didRegisterCutomFonts {
            registerCustomFonts()
        }

        if let option {
            if useScaledFonts {
                let font = Font.custom(style.fontName(for: fontFamily).rawValue, size: style.pointSize, relativeTo: style.textStyle)
                return set(font: font, with: option)
            } else {
                let font = Font.custom(style.fontName(for: fontFamily).rawValue, fixedSize: style.pointSize)
                return set(font: font, with: option)
            }
        } else {
            if useScaledFonts {
                return Font.custom(style.fontName(for: fontFamily).rawValue, size: style.pointSize, relativeTo: style.textStyle)
            } else {
                return Font.custom(style.fontName(for: fontFamily).rawValue, fixedSize: style.pointSize)
            }
        }
    }

    private static func set(font: Font, with option: FontOption) -> Font {
        switch option {
        case .small:
            return font.smallCaps()
        case .lowercaseSmallCaps:
            return font.lowercaseSmallCaps()
        case .uppercaseCaps:
            return font.uppercaseSmallCaps()
        case .italic:
            return font.italic()
        }
    }
}

public enum TuxedoFontFamily {
    case montserrat
}

public enum TuxedoFontName: String, CaseIterable {
    // Montserrat Styles
    case montserratRegular = "Montserrat-Regular"
    case montserratSemiBold = "Montserrat-SemiBold"
    case montserratExtraBold = "Montserrat-ExtraBold"

    var requiresRegistration: Bool {
        switch self {
        case .montserratRegular, .montserratSemiBold, .montserratExtraBold: return true
        }
    }
}

private extension Font {
    static var didRegisterCutomFonts: Bool = false

    /// This method must be called before you can use any non-system / custom font returned by any of the public `font()` methods.  Specifically, this means
    /// if you are using `monterrat`, you must call this method first (`avenir` is supplied by the OS).
    static func registerCustomFonts() {
        let fontsRequiringRegistration = TuxedoFontName.allCases.filter { $0.requiresRegistration }

        for font in fontsRequiringRegistration {
            guard let url = Bundle.module.url(forResource: font.rawValue, withExtension: "ttf") else {
                //                Log.nonfatal(.unavailableFont(name: font.rawValue))
                continue
            }

            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }

        didRegisterCutomFonts = true
    }
}

public enum TuxedoFontStyle: CaseIterable {
    case h2
    case h3
    case h4
    case h5
    case h5Light
    case h5Bold
    case body
    case bodyBold
    case bodyExtraBold
    case caption
    case captionBold
    case captionExtraBold
    case tiny

    func fontName(for family: TuxedoFontFamily) -> TuxedoFontName {
        switch self {
        case .h2:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .h3:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .h4:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .h5:
            switch family {
            case .montserrat: return .montserratSemiBold
            }
        case .h5Light:
            switch family {
            case .montserrat: return .montserratRegular
            }
        case .h5Bold:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .body:
            switch family {
            case .montserrat: return .montserratRegular
            }
        case .bodyBold:
            switch family {
            case .montserrat: return .montserratSemiBold
            }
        case .bodyExtraBold:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .caption:
            switch family {
            case .montserrat: return .montserratRegular
            }
        case .captionBold:
            switch family {
            case .montserrat: return .montserratSemiBold
            }
        case .captionExtraBold:
            switch family {
            case .montserrat: return .montserratExtraBold
            }
        case .tiny:
            switch family {
            case .montserrat: return .montserratSemiBold
            }
        }
    }

    var pointSize: CGFloat {
        switch self {
        case .h2: return 36.0
        case .h3: return 26.0
        case .h4: return 20.0
        case .h5: return 16.0
        case .h5Light: return 16.0
        case .h5Bold: return 16.0
        case .body: return 14.0
        case .bodyBold: return 14.0
        case .bodyExtraBold: return 14.0
        case .caption: return 12.0
        case .captionBold: return 12.0
        case .captionExtraBold: return 12.0
        case .tiny: return 10.0
        }
    }

    var textStyle: Font.TextStyle {
        switch self {
        case .h2: return .title2
        case .h3: return .title3
        case .h4: return .headline
        case .h5: return .subheadline
        case .h5Light: return .subheadline
        case .h5Bold: return .subheadline
        case .body: return .body
        case .bodyBold: return .body
        case .bodyExtraBold: return .body
        case .caption: return .caption
        case .captionBold: return .caption
        case .captionExtraBold: return .caption
        case .tiny: return .caption2
        }
    }
}
