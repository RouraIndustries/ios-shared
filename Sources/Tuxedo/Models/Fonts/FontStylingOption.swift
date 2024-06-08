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

    /// Apply the styling option to the given font.
    ///
    /// - Parameters:
    ///    - font: The font to apply the styling option.
    /// - Returns: The modified font with the applied styling option.
    func apply(to font: Font) -> Font {
        switch self {
        case .smallCaps:            return font.smallCaps()
        case .lowercaseSmallCaps:   return font.lowercaseSmallCaps()
        case .uppercaseSmallCaps:   return font.uppercaseSmallCaps()
        case .italic:               return font.italic()
        case .bold:                 return font.bold()
        }
    }
}
