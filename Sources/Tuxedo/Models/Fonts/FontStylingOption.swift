//
//  FontStylingOption.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

public enum FontStylingOption {
    case smallCaps
    case lowercaseSmallCaps
    case uppercaseSmallCaps
    case italic
    case bold

    /// Apply the styling option to the given font, if applicable for the specified font family.
    ///
    /// - Parameters:
    ///    - font: The font to apply the styling option.
    ///    - fontFamily: The font family to which the font belongs.
    /// - Returns: The modified font with the applied styling option, or the original font if the styling is not applicable for the font family.
    public func apply(to font: Font, fontFamily: RouraFontFamily = .montserrat) -> Font {

        // Check if the font family supports font styling options
        guard fontFamily == .montserrat else { return font }

        // Apply the styling option based on the enum case
        switch self {
        case .smallCaps:            return font.smallCaps()
        case .lowercaseSmallCaps:   return font.lowercaseSmallCaps()
        case .uppercaseSmallCaps:   return font.uppercaseSmallCaps()
        case .italic:               return font.italic()
        case .bold:                 return font.bold()
        }
    }
}
