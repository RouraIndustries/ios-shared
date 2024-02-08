//
//  UIColor-Ext.swift
//
//
//  Created by Christopher J. Roura on 3/13/24.
//

import UIKit

public extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: Double = 1) -> UIColor {
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }

    static func w(_ white: CGFloat, alpha: Double = 1) -> UIColor {
        UIColor(white: white / 255, alpha: alpha)
    }

    convenience init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        lightHighContrast lightModeHighContrastColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor,
        darkHighContrast darkModeHighContrastColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return traitCollection.isHighContrastEnabled ? lightModeColor() : lightModeHighContrastColor()
            case .dark:
                return traitCollection.isHighContrastEnabled ? darkModeColor() : darkModeHighContrastColor()
            case .unspecified:
                return traitCollection.isHighContrastEnabled ? lightModeColor() : lightModeHighContrastColor()
            @unknown default:
                return traitCollection.isHighContrastEnabled ? lightModeColor() : lightModeHighContrastColor()
            }
        }
    }
}

public extension UIColor {
    static var backgroundPrimary: UIColor {
        UIColor(
            light: ValueColor.white.component,
            lightHighContrast: ValueColor.white.component,
            dark: ValueColor.black.component,
            darkHighContrast: ValueColor.black3.component
        )
    }

    static var backgroundRaised: UIColor {
        UIColor(
            light: ValueColor.white.component,
            lightHighContrast: ValueColor.white.component,
            dark: ValueColor.black4.component,
            darkHighContrast: ValueColor.black4.component
        )
    }

    static var backgroundRecessed: UIColor {
        UIColor(
            light: ValueColor.grey7.component,
            lightHighContrast: ValueColor.grey7.component,
            dark: ValueColor.black2.component,
            darkHighContrast: ValueColor.black2.component
        )
    }

    static var foregroundPrimary: UIColor {
        UIColor(
            light: ValueColor.black4.component,
            lightHighContrast: ValueColor.black4.component,
            dark: ValueColor.grey7.component,
            darkHighContrast: ValueColor.grey7.component
        )
    }

    static var foregroundSecondary: UIColor {
        UIColor(
            light: ValueColor.grey1.component,
            lightHighContrast: ValueColor.grey1.component,
            dark: ValueColor.grey4.component,
            darkHighContrast: ValueColor.grey4.component
        )
    }

    static var foregroundDisabled: UIColor {
        UIColor(
            light: ValueColor.grey3.component,
            lightHighContrast: ValueColor.grey3.component,
            dark: ValueColor.black7.component,
            darkHighContrast: ValueColor.black7.component
        )
    }

    static var foregroundTint: UIColor {
        UIColor(
            light: ValueColor.grey6.component,
            lightHighContrast: ValueColor.grey6.component,
            dark: ValueColor.black5.component,
            darkHighContrast: ValueColor.black5.component
        )
    }

    static var bluePrimary: UIColor {
        UIColor(
            light: ValueColor.blue2.component,
            lightHighContrast: ValueColor.blue1.component,
            dark: ValueColor.blue4.component,
            darkHighContrast: ValueColor.blue4.component
        )
    }

    static var greenPrimary: UIColor {
        UIColor(
            light: ValueColor.green1.component,
            lightHighContrast: ValueColor.green1.component,
            dark: ValueColor.green3.component,
            darkHighContrast: ValueColor.green3.component
        )
    }

    static var yellowPrimary: UIColor {
        UIColor(
            light: ValueColor.yellow1.component,
            lightHighContrast: ValueColor.yellow1.component,
            dark: ValueColor.yellow3.component,
            darkHighContrast: ValueColor.yellow3.component
        )
    }

    static var orangePrimary: UIColor {
        UIColor(
            light: ValueColor.orange1.component,
            lightHighContrast: ValueColor.orange1.component,
            dark: ValueColor.orange1.component,
            darkHighContrast: ValueColor.orange1.component
        )
    }

    static var redPrimary: UIColor {
        UIColor(
            light: ValueColor.red1.component,
            lightHighContrast: ValueColor.red1.component,
            dark: ValueColor.red3.component,
            darkHighContrast: ValueColor.red3.component
        )
    }

    static var midnightPrimary: UIColor {
        UIColor(
            light: ValueColor.blue3.component,
            lightHighContrast: ValueColor.blue3.component,
            dark: ValueColor.blue3.component,
            darkHighContrast: ValueColor.blue3.component
        )
    }

    static var shadow: UIColor {
        UIColor(
            light: ValueColor.black1.component.withAlphaComponent(0.16),
            lightHighContrast: ValueColor.black1.component.withAlphaComponent(0.16),
            dark: ValueColor.black0.component.withAlphaComponent(0.95),
            darkHighContrast: ValueColor.black0.component.withAlphaComponent(0.95)
        )
    }

    static var overlay: UIColor {
        UIColor(
            light: ValueColor.white.component.withAlphaComponent(0.9),
            lightHighContrast: ValueColor.white.component.withAlphaComponent(0.9),
            dark: ValueColor.black3.component.withAlphaComponent(0.9),
            darkHighContrast: ValueColor.black3.component.withAlphaComponent(0.9)
        )
    }

    static var overlayDark: UIColor {
        UIColor(
            light: ValueColor.black4.component.withAlphaComponent(0.16),
            lightHighContrast: ValueColor.black4.component.withAlphaComponent(0.16),
            dark: ValueColor.black0.component.withAlphaComponent(0.75),
            darkHighContrast: ValueColor.black0.component.withAlphaComponent(0.75)
        )
    }

    static var whitePrimary: UIColor {
        UIColor(
            light: ValueColor.white.component,
            lightHighContrast: ValueColor.white.component,
            dark: ValueColor.white.component,
            darkHighContrast: ValueColor.white.component
        )
    }
}
