//
//  FontComponents.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import SwiftUI

/// The necessary components that make up a specific `UIFont` within the Roura design system.
public struct FontComponents {
    public let fontName: RouraFontName
    public let pointSize: CGFloat
    public let textStyle: UIFont.TextStyle
    public let swiftUITextStyle: Font.TextStyle

    public init(
        fontName: RouraFontName,
        pointSize: CGFloat,
        textStyle: UIFont.TextStyle? = nil,
        swiftUITextStyle: Font.TextStyle? = nil
    ) {
        self.fontName = fontName
        self.pointSize = pointSize
        self.textStyle = textStyle ?? .body
        self.swiftUITextStyle = swiftUITextStyle ?? .body
    }
}
