//
//  RouraFontName.swift
//  
//
//  Created by Christopher J. Roura on 6/7/24.
//

import Foundation

/// Defines the font names for different font weights.
public enum RouraFontName: String, CaseIterable {
    // Lexend styles
    case lexendThin         = "Lexend-Thin"
    case lexendExtraLight   = "Lexend-ExtraLight"
    case lexendMedium       = "Lexend-Medium"
    case lexendBold         = "Lexend-Bold"

    // Montserrat Styles
    case montserratRegular      = "Montserrat-Regular"
    case montserratSemiBold     = "Montserrat-SemiBold"
    case montserratExtraBold    = "Montserrat-ExtraBold"

    var requiresRegistration: Bool {
        switch self {
        case .montserratRegular, .montserratSemiBold, .montserratExtraBold: return true
        case .lexendThin, .lexendExtraLight, .lexendMedium, .lexendBold: return true
        }
    }
}
