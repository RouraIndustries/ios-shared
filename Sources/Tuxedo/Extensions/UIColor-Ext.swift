//
//  UIColor-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/6/24.
//

import UIKit

// MARK: - Convenience Initializers
public extension UIColor {

    class func rgb(
        _ r: UIColorComponent,
        _ g: UIColorComponent,
        _ b: UIColorComponent,
        _ a: UIColorAlphaComponent = 1.0
    ) -> UIColor {
        UIColor(red: r.rawValue, green: g.rawValue, blue: b.rawValue, alpha: a.rawValue)
    }

    class func w(
        _ w: UIColorComponent,
        _ a: UIColorAlphaComponent = 1.0
    ) -> UIColor {
        UIColor(white: w.rawValue, alpha: a.rawValue)
    }
}

// MARK: - Accessor Methods
public extension UIColor {

    class func value(_ valueColor: ValueColor) -> UIColor {
        valueColor.components.uiColor
    }

    class func semantic(_ semanticColor: SemanticColor) -> UIColor {

        return UIColor.init { traitCollection -> UIColor in
            return semanticColor.valueComponents(for: traitCollection).uiColor
        }
    }
}

// MARK: - Property wrapper allowing for single-line passthrough definitions
@propertyWrapper public class RouraUIColor {

    public var wrappedValue: UIColor

    init(valueColor: ValueColor) {
        self.wrappedValue = UIColor.value(valueColor)
    }

    init(semanticColor: SemanticColor) {
        self.wrappedValue = UIColor.semantic(semanticColor)
    }
}

// MARK: - Passthrough Value Colors
public extension UIColor {

    @RouraUIColor(valueColor: .blue1) @objc static var blue1: UIColor
    @RouraUIColor(valueColor: .blue2) @objc static var blue2: UIColor
    @RouraUIColor(valueColor: .blue3) @objc static var blue3: UIColor
    @RouraUIColor(valueColor: .blue4) @objc static var blue4: UIColor
    @RouraUIColor(valueColor: .blue5) @objc static var blue5: UIColor
    @RouraUIColor(valueColor: .blue6) @objc static var blue6: UIColor
    @RouraUIColor(valueColor: .blue7) @objc static var blue7: UIColor
    @RouraUIColor(valueColor: .blue8) @objc static var blue8: UIColor

    @RouraUIColor(valueColor: .green1) @objc static var green1: UIColor
    @RouraUIColor(valueColor: .green2) @objc static var green2: UIColor
    @RouraUIColor(valueColor: .green3) @objc static var green3: UIColor
    @RouraUIColor(valueColor: .green4) @objc static var green4: UIColor
    @RouraUIColor(valueColor: .green5) @objc static var green5: UIColor
    @RouraUIColor(valueColor: .green6) @objc static var green6: UIColor
    @RouraUIColor(valueColor: .green7) @objc static var green7: UIColor
    @RouraUIColor(valueColor: .green8) @objc static var green8: UIColor

    @RouraUIColor(valueColor: .yellow1) @objc static var yellow1: UIColor
    @RouraUIColor(valueColor: .yellow2) @objc static var yellow2: UIColor
    @RouraUIColor(valueColor: .yellow3) @objc static var yellow3: UIColor
    @RouraUIColor(valueColor: .yellow4) @objc static var yellow4: UIColor
    @RouraUIColor(valueColor: .yellow5) @objc static var yellow5: UIColor
    @RouraUIColor(valueColor: .yellow6) @objc static var yellow6: UIColor
    @RouraUIColor(valueColor: .yellow7) @objc static var yellow7: UIColor
    @RouraUIColor(valueColor: .yellow8) @objc static var yellow8: UIColor

    @RouraUIColor(valueColor: .orange1) @objc static var orange1: UIColor
    @RouraUIColor(valueColor: .orange2) @objc static var orange2: UIColor
    @RouraUIColor(valueColor: .orange3) @objc static var orange3: UIColor
    @RouraUIColor(valueColor: .orange4) @objc static var orange4: UIColor
    @RouraUIColor(valueColor: .orange5) @objc static var orange5: UIColor
    @RouraUIColor(valueColor: .orange6) @objc static var orange6: UIColor
    @RouraUIColor(valueColor: .orange7) @objc static var orange7: UIColor
    @RouraUIColor(valueColor: .orange8) @objc static var orange8: UIColor

    @RouraUIColor(valueColor: .red1) @objc static var red1: UIColor
    @RouraUIColor(valueColor: .red2) @objc static var red2: UIColor
    @RouraUIColor(valueColor: .red3) @objc static var red3: UIColor
    @RouraUIColor(valueColor: .red4) @objc static var red4: UIColor
    @RouraUIColor(valueColor: .red5) @objc static var red5: UIColor
    @RouraUIColor(valueColor: .red6) @objc static var red6: UIColor
    @RouraUIColor(valueColor: .red7) @objc static var red7: UIColor
    @RouraUIColor(valueColor: .red8) @objc static var red8: UIColor

    @RouraUIColor(valueColor: .grey1) @objc static var grey1: UIColor
    @RouraUIColor(valueColor: .grey2) @objc static var grey2: UIColor
    @RouraUIColor(valueColor: .grey3) @objc static var grey3: UIColor
    @RouraUIColor(valueColor: .grey4) @objc static var grey4: UIColor
    @RouraUIColor(valueColor: .grey5) @objc static var grey5: UIColor
    @RouraUIColor(valueColor: .grey6) @objc static var grey6: UIColor
    @RouraUIColor(valueColor: .grey7) @objc static var grey7: UIColor
    @RouraUIColor(valueColor: .grey8) @objc static var grey8: UIColor

    @RouraUIColor(valueColor: .black0) @objc static var black0: UIColor
    @RouraUIColor(valueColor: .black1) @objc static var black1: UIColor
    @RouraUIColor(valueColor: .black2) @objc static var black2: UIColor
    @RouraUIColor(valueColor: .black3) @objc static var black3: UIColor
    @RouraUIColor(valueColor: .black4) @objc static var black4: UIColor
    @RouraUIColor(valueColor: .black5) @objc static var black5: UIColor
    @RouraUIColor(valueColor: .black6) @objc static var black6: UIColor
    @RouraUIColor(valueColor: .black7) @objc static var black7: UIColor
    @RouraUIColor(valueColor: .black8) @objc static var black8: UIColor
}

// MARK: - Passthrough Semantic Colors
public extension UIColor {

    @RouraUIColor(semanticColor: .backgroundPrimary) @objc static var backgroundPrimary: UIColor
    @RouraUIColor(semanticColor: .backgroundRaised) @objc static var backgroundRaised: UIColor
    @RouraUIColor(semanticColor: .backgroundRecessed) @objc static var backgroundRecessed: UIColor

    @RouraUIColor(semanticColor: .foregroundPrimary) @objc static var foregroundPrimary: UIColor
    @RouraUIColor(semanticColor: .foregroundSecondary) @objc static var foregroundSecondary: UIColor
    @RouraUIColor(semanticColor: .foregroundDisabled) @objc static var foregroundDisabled: UIColor
    @RouraUIColor(semanticColor: .foregroundTint) @objc static var foregroundTint: UIColor

    @RouraUIColor(semanticColor: .bluePrimary) @objc static var bluePrimary: UIColor
    @RouraUIColor(semanticColor: .blueTint75) @objc static var blueTint75: UIColor
    @RouraUIColor(semanticColor: .blueTint25) @objc static var blueTint25: UIColor
    @RouraUIColor(semanticColor: .blueTint08) @objc static var blueTint08: UIColor

    @RouraUIColor(semanticColor: .greenPrimary) @objc static var greenPrimary: UIColor
    @RouraUIColor(semanticColor: .greenTint75) @objc static var greenTint75: UIColor
    @RouraUIColor(semanticColor: .greenTint25) @objc static var greenTint25: UIColor
    @RouraUIColor(semanticColor: .greenTint08) @objc static var greenTint08: UIColor

    @RouraUIColor(semanticColor: .yellowPrimary) @objc static var yellowPrimary: UIColor
    @RouraUIColor(semanticColor: .yellowTint75) @objc static var yellowTint75: UIColor
    @RouraUIColor(semanticColor: .yellowTint25) @objc static var yellowTint25: UIColor
    @RouraUIColor(semanticColor: .yellowTint08) @objc static var yellowTint08: UIColor

    @RouraUIColor(semanticColor: .orangePrimary) @objc static var orangePrimary: UIColor
    @RouraUIColor(semanticColor: .orangeTint75) @objc static var orangeTint75: UIColor
    @RouraUIColor(semanticColor: .orangeTint25) @objc static var orangeTint25: UIColor
    @RouraUIColor(semanticColor: .orangeTint08) @objc static var orangeTint08: UIColor

    @RouraUIColor(semanticColor: .redPrimary) @objc static var redPrimary: UIColor
    @RouraUIColor(semanticColor: .redTint75) @objc static var redTint75: UIColor
    @RouraUIColor(semanticColor: .redTint25) @objc static var redTint25: UIColor
    @RouraUIColor(semanticColor: .redTint08) @objc static var redTint08: UIColor

    @RouraUIColor(semanticColor: .shadow) @objc static var shadow: UIColor
    @RouraUIColor(semanticColor: .shadow75) @objc static var shadow75: UIColor
    @RouraUIColor(semanticColor: .shadow35) @objc static var shadow35: UIColor

    @RouraUIColor(semanticColor: .overlayDark) @objc static var overlayDark: UIColor
    @RouraUIColor(semanticColor: .overlay) @objc static var overlay: UIColor
    @RouraUIColor(semanticColor: .alwaysWhite) @objc static var alwaysWhite: UIColor
}
