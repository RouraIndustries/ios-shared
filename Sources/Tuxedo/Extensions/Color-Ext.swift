//
//  Color-Ext.swift
//
//
//  Created by Christopher J. Roura on 3/13/24.
//

import SwiftUI

public extension Color {
    init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        lightHighContrast lightModeHighContrastColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color,
        darkHighContrast darkModeHighContrastColor: @escaping @autoclosure () -> Color
    ) {
        self.init(
            UIColor(
                light: UIColor(lightModeColor()),
                lightHighContrast: UIColor(lightModeHighContrastColor()),
                dark: UIColor(darkModeColor()),
                darkHighContrast: UIColor(darkModeHighContrastColor())
            )
        )
    }
}

public extension Color {
    static var backgroundPrimary: Color {
        Color(uiColor: .backgroundPrimary)
    }

    static var backgroundRaised: Color {
        Color(uiColor: .backgroundRaised)
    }

    static var backgroundRecessed: Color {
        Color(uiColor: .backgroundRecessed)
    }

    static var foregroundPrimary: Color {
        Color(uiColor: .foregroundPrimary)
    }

    static var foregroundSecondary: Color {
        Color(uiColor: .foregroundSecondary)
    }

    static var foregroundDisabled: Color {
        Color(uiColor: .foregroundDisabled)
    }

    static var foregroundTint: Color {
        Color(uiColor: .foregroundTint)
    }

    static var bluePrimary: Color {
        Color(uiColor: .bluePrimary)
    }

    static var greenPrimary: Color {
        Color(uiColor: .greenPrimary)
    }

    static var yellowPrimary: Color {
        Color(uiColor: .yellowPrimary)
    }

    static var orangePrimary: Color {
        Color(uiColor: .orangePrimary)
    }

    static var redPrimary: Color {
        Color(uiColor: .redPrimary)
    }

    static var midnightPrimary: Color {
        Color(uiColor: .midnightPrimary)
    }

    static var shadow: Color {
        Color(uiColor: .shadow)
    }

    static var overlay: Color {
        Color(uiColor: .overlay)
    }

    static var overlayDark: Color {
        Color(uiColor: .overlayDark)
    }

    static var whitePrimary: Color {
        Color(uiColor: .whitePrimary)
    }
}
