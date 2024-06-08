//
//  Color-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/6/24.
//

import SwiftUI

@propertyWrapper public struct RouraColor {

    public var wrappedValue: Color {
        get { Color(uiColor) }
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
        return Color(uiColor)
    }

    static func semantic(_ semanticColor: SemanticColor) -> Color {

        let uiColor = UIColor.semantic(semanticColor)
        return Color(uiColor)
    }
}

// MARK: - Passthrough Semantic Colors
public extension Color {

    @RouraColor(uiColor: .backgroundPrimary) static var backgroundPrimary: Color
    @RouraColor(uiColor: .backgroundRaised) static var backgroundRaised: Color
    @RouraColor(uiColor: .backgroundRecessed) static var backgroundRecessed: Color

    @RouraColor(uiColor: .foregroundPrimary) static var foregroundPrimary: Color
    @RouraColor(uiColor: .foregroundSecondary) static var foregroundSecondary: Color
    @RouraColor(uiColor: .foregroundDisabled) static var foregroundDisabled: Color
    @RouraColor(uiColor: .foregroundTint) static var foregroundTint: Color

    @RouraColor(uiColor: .bluePrimary) static var bluePrimary: Color
    @RouraColor(uiColor: .blueTint75) static var blueTint75: Color
    @RouraColor(uiColor: .blueTint25) static var blueTint25: Color
    @RouraColor(uiColor: .blueTint08) static var blueTint08: Color

    @RouraColor(uiColor: .greenPrimary) static var greenPrimary: Color
    @RouraColor(uiColor: .greenTint75) static var greenTint75: Color
    @RouraColor(uiColor: .greenTint25) static var greenTint25: Color
    @RouraColor(uiColor: .greenTint08) static var greenTint08: Color

    @RouraColor(uiColor: .yellowPrimary) static var yellowPrimary: Color
    @RouraColor(uiColor: .yellowTint75) static var yellowTint75: Color
    @RouraColor(uiColor: .yellowTint25) static var yellowTint25: Color
    @RouraColor(uiColor: .yellowTint08) static var yellowTint08: Color

    @RouraColor(uiColor: .orangePrimary) static var orangePrimary: Color
    @RouraColor(uiColor: .orangeTint75) static var orangeTint75: Color
    @RouraColor(uiColor: .orangeTint25) static var orangeTint25: Color
    @RouraColor(uiColor: .orangeTint08) static var orangeTint08: Color

    @RouraColor(uiColor: .redPrimary) static var redPrimary: Color
    @RouraColor(uiColor: .redTint75) static var redTint75: Color
    @RouraColor(uiColor: .redTint25) static var redTint25: Color
    @RouraColor(uiColor: .redTint08) static var redTint08: Color

    @RouraColor(uiColor: .shadow) static var shadow: Color
    @RouraColor(uiColor: .shadow75) static var shadow75: Color
    @RouraColor(uiColor: .shadow35) static var shadow35: Color

    @RouraColor(uiColor: .overlayDark) static var overlayDark: Color
    @RouraColor(uiColor: .overlay) static var overlay: Color
    @RouraColor(uiColor: .alwaysWhite) static var alwaysWhite: Color
}

// MARK: - Passthrough Semantic Colors for ShapeStyle
public extension ShapeStyle where Self == Color {
    static var backgroundPrimary: Color { Color.backgroundPrimary }
    static var backgroundRaised: Color { Color.backgroundRaised }
    static var backgroundRecessed: Color { Color.backgroundRecessed }

    static var foregroundPrimary: Color { Color.foregroundPrimary }
    static var foregroundSecondary: Color { Color.foregroundSecondary }
    static var foregroundDisabled: Color { Color.foregroundDisabled }
    static var foregroundTint: Color { Color.foregroundTint }

    static var bluePrimary: Color { Color.bluePrimary }
    static var blueTint75: Color { Color.blueTint75 }
    static var blueTint25: Color { Color.blueTint25 }
    static var blueTint08: Color { Color.blueTint08 }

    static var greenPrimary: Color { Color.greenPrimary }
    static var greenTint75: Color { Color.greenTint75 }
    static var greenTint25: Color { Color.greenTint25 }
    static var greenTint08: Color { Color.greenTint08 }

    static var yellowPrimary: Color { Color.yellowPrimary }
    static var yellowTint75: Color { Color.yellowTint75 }
    static var yellowTint25: Color { Color.yellowTint25 }
    static var yellowTint08: Color { Color.yellowTint08 }

    static var orangePrimary: Color { Color.orangePrimary }
    static var orangeTint75: Color { Color.orangeTint75 }
    static var orangeTint25: Color { Color.orangeTint25 }
    static var orangeTint08: Color { Color.orangeTint08 }

    static var redPrimary: Color { Color.redPrimary }
    static var redTint75: Color { Color.redTint75 }
    static var redTint25: Color { Color.redTint25 }
    static var redTint08: Color { Color.redTint08 }

    static var shadow: Color { Color.shadow }
    static var shadow75: Color { Color.shadow75 }
    static var shadow35: Color { Color.shadow35 }

    static var overlayDark: Color { Color.overlayDark }
    static var overlay: Color { Color.overlay }
    static var alwaysWhite: Color { Color.alwaysWhite }
}
