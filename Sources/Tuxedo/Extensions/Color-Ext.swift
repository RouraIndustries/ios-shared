//
//  Color-Ext.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import SwiftUI

/// The way to convert a UIColor to a SwiftUI Color changed in iOS 15.  This property wrapper does the work of using the proper initiailzer based on the OS.
@propertyWrapper public struct TuxedoColor {
    public var wrappedValue: Color {
        get {
            if #available(iOS 15.0, *) {
                return Color(uiColor: uiColor)
            } else {
                return Color(uiColor)
            }
        }
    }
    private var uiColor: UIColor

    init(uiColor: UIColor) {
        self.uiColor = uiColor
    }
}

// MARK: - Accessor Methods

public extension Color {
    static func value(_ valueColor: ValueColor) -> Color {
        let uiColor = UIColor.value(valueColor)

        if #available(iOS 15.0, *) {
            return Color(uiColor: uiColor)
        } else {
            return Color(uiColor)
        }
    }

    static func semantic(_ semanticColor: SemanticColor) -> Color {
        let uiColor = UIColor.semantic(semanticColor)

        if #available(iOS 15.0, *) {
            return Color(uiColor: uiColor)
        } else {
            return Color(uiColor)
        }
    }
}

// MARK: - Passthrough Semantic Colors

public extension Color {
    @TuxedoColor(uiColor: .backgroundPrimary) static var backgroundPrimary: Color
    @TuxedoColor(uiColor: .backgroundRaised) static var backgroundRaised: Color
    @TuxedoColor(uiColor: .backgroundRecessed) static var backgroundRecessed: Color

    @TuxedoColor(uiColor: .foregroundPrimary) static var foregroundPrimary: Color
    @TuxedoColor(uiColor: .foregroundSecondary) static var foregroundSecondary: Color
    @TuxedoColor(uiColor: .foregroundDisabled) static var foregroundDisabled: Color
    @TuxedoColor(uiColor: .foregroundTint) static var foregroundTint: Color

    @TuxedoColor(uiColor: .bluePrimary) static var bluePrimary: Color
    @TuxedoColor(uiColor: .greenPrimary) static var greenPrimary: Color
    @TuxedoColor(uiColor: .yellowPrimary) static var yellowPrimary: Color
    @TuxedoColor(uiColor: .orangePrimary) static var orangePrimary: Color
    @TuxedoColor(uiColor: .redPrimary) static var redPrimary: Color

    @TuxedoColor(uiColor: .shadow) static var shadow: Color
    @TuxedoColor(uiColor: .overlayDark) static var overlayDark: Color
    @TuxedoColor(uiColor: .overlay) static var overlay: Color
    @TuxedoColor(uiColor: .alwaysWhite) static var alwaysWhite: Color
}

// MARK: - Passthrough Semantic Colors

public extension ShapeStyle where Self == Color {
    static var backgroundPrimary: Color { Color.backgroundPrimary }
    static var backgroundRaised: Color { Color.backgroundRaised }
    static var backgroundRecessed: Color { Color.backgroundRecessed }

    static var foregroundPrimary: Color { Color.foregroundPrimary }
    static var foregroundSecondary: Color { Color.foregroundSecondary }
    static var foregroundDisabled: Color { Color.foregroundDisabled }
    static var foregroundTint: Color { Color.foregroundTint }

    static var bluePrimary: Color { Color.bluePrimary }
    static var greenPrimary: Color { Color.greenPrimary }
    static var yellowPrimary: Color { Color.yellowPrimary }
    static var orangePrimary: Color { Color.orangePrimary }
    static var redPrimary: Color { Color.redPrimary }

    static var shadow: Color { Color.shadow }
    static var overlayDark: Color { Color.overlayDark }
    static var overlay: Color { Color.overlay }
    static var alwaysWhite: Color { Color.alwaysWhite }
}
