//
//  Text-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

public extension Text {
    func tuxedoFont(
        _ style: RouraFontStyle,
        fontFamily: RouraFontFamily = .montserrat,
        useScaledFont: Bool = true,
        option: FontStylingOption? = nil
    ) -> Text {
        self.font(Font.font(style: style, fontFamily: fontFamily, useScaledFont: useScaledFont, option: option))
    }
}
