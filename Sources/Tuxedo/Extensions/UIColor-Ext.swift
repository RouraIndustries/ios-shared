//
//  UIColor-Ext.swift
//  
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit
import RouraFoundation

// MARK: - Convenience Initializers

public extension UIColor {
    class func rgb(_ r: UIColorComponent, _ g: UIColorComponent, _ b: UIColorComponent, _ a: UIColorAlphaComponent = 1.0) -> UIColor {
        UIColor(red: r.rawValue, green: g.rawValue, blue: b.rawValue, alpha: a.rawValue)
    }

    class func w(_ w: UIColorComponent, _ a: UIColorAlphaComponent = 1.0) -> UIColor {
        UIColor(white: w.rawValue, alpha: a.rawValue)
    }
}

// MARK: - Accessor Methods

public extension UIColor {
    class func value(_ valueColor: ValueColor) -> UIColor {
        valueColor.components.uiColor
    }

    class func semantic(_ semanticColor: SemanticColor) -> UIColor {
        UIColor.init { traitCollection -> UIColor in
            semanticColor.valueComponents(for: traitCollection).uiColor
        }
    }
}

// MARK: - Property wrapper allowing for single-line passthrough definitions

@propertyWrapper public class TuxedoUIColor {
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
    /**
     * NOTE: Passthroughs for value colors have only been defined here for the ones that are (at the time of writing)
     * currently used in the Consumer and Runner apps. Long term, all apps should use the semantic color passthroughs
     * exclusively, allowing us to delete all of these value passthroughs.
     */

    @TuxedoUIColor(valueColor: .blue1) @objc static var blue1: UIColor
    @TuxedoUIColor(valueColor: .blue2) @objc static var blue2: UIColor
    @TuxedoUIColor(valueColor: .blue3) @objc static var blue3: UIColor
    @TuxedoUIColor(valueColor: .blue4) @objc static var blue4: UIColor
    @TuxedoUIColor(valueColor: .blue5) @objc static var blue5: UIColor
    @TuxedoUIColor(valueColor: .blue6) @objc static var blue6: UIColor
    @TuxedoUIColor(valueColor: .blue7) @objc static var blue7: UIColor
    @TuxedoUIColor(valueColor: .blue8) @objc static var blue8: UIColor

    @TuxedoUIColor(valueColor: .green1) @objc static var green1: UIColor
    @TuxedoUIColor(valueColor: .green2) @objc static var green2: UIColor
    @TuxedoUIColor(valueColor: .green3) @objc static var green3: UIColor
    @TuxedoUIColor(valueColor: .green4) @objc static var green4: UIColor
    @TuxedoUIColor(valueColor: .green5) @objc static var green5: UIColor
    @TuxedoUIColor(valueColor: .green6) @objc static var green6: UIColor
    @TuxedoUIColor(valueColor: .green7) @objc static var green7: UIColor
    @TuxedoUIColor(valueColor: .green8) @objc static var green8: UIColor

    @TuxedoUIColor(valueColor: .yellow1) @objc static var yellow1: UIColor
    @TuxedoUIColor(valueColor: .yellow2) @objc static var yellow2: UIColor
    @TuxedoUIColor(valueColor: .yellow3) @objc static var yellow3: UIColor
    @TuxedoUIColor(valueColor: .yellow4) @objc static var yellow4: UIColor
    @TuxedoUIColor(valueColor: .yellow5) @objc static var yellow5: UIColor
    @TuxedoUIColor(valueColor: .yellow6) @objc static var yellow6: UIColor
    @TuxedoUIColor(valueColor: .yellow7) @objc static var yellow7: UIColor
    @TuxedoUIColor(valueColor: .yellow8) @objc static var yellow8: UIColor

    @TuxedoUIColor(valueColor: .orange1) @objc static var orange1: UIColor
    @TuxedoUIColor(valueColor: .orange2) @objc static var orange2: UIColor
    @TuxedoUIColor(valueColor: .orange3) @objc static var orange3: UIColor
    @TuxedoUIColor(valueColor: .orange4) @objc static var orange4: UIColor
    @TuxedoUIColor(valueColor: .orange5) @objc static var orange5: UIColor
    @TuxedoUIColor(valueColor: .orange6) @objc static var orange6: UIColor
    @TuxedoUIColor(valueColor: .orange7) @objc static var orange7: UIColor
    @TuxedoUIColor(valueColor: .orange8) @objc static var orange8: UIColor

    @TuxedoUIColor(valueColor: .red1) @objc static var red1: UIColor
    @TuxedoUIColor(valueColor: .red2) @objc static var red2: UIColor
    @TuxedoUIColor(valueColor: .red3) @objc static var red3: UIColor
    @TuxedoUIColor(valueColor: .red4) @objc static var red4: UIColor
    @TuxedoUIColor(valueColor: .red5) @objc static var red5: UIColor
    @TuxedoUIColor(valueColor: .red6) @objc static var red6: UIColor
    @TuxedoUIColor(valueColor: .red7) @objc static var red7: UIColor
    @TuxedoUIColor(valueColor: .red8) @objc static var red8: UIColor

    @TuxedoUIColor(valueColor: .grey1) @objc static var grey1: UIColor
    @TuxedoUIColor(valueColor: .grey2) @objc static var grey2: UIColor
    @TuxedoUIColor(valueColor: .grey3) @objc static var grey3: UIColor
    @TuxedoUIColor(valueColor: .grey4) @objc static var grey4: UIColor
    @TuxedoUIColor(valueColor: .grey5) @objc static var grey5: UIColor
    @TuxedoUIColor(valueColor: .grey6) @objc static var grey6: UIColor
    @TuxedoUIColor(valueColor: .grey7) @objc static var grey7: UIColor
    @TuxedoUIColor(valueColor: .grey8) @objc static var grey8: UIColor

    @TuxedoUIColor(valueColor: .black0) @objc static var black0: UIColor
    @TuxedoUIColor(valueColor: .black1) @objc static var black1: UIColor
    @TuxedoUIColor(valueColor: .black2) @objc static var black2: UIColor
    @TuxedoUIColor(valueColor: .black3) @objc static var black3: UIColor
    @TuxedoUIColor(valueColor: .black4) @objc static var black4: UIColor
    @TuxedoUIColor(valueColor: .black5) @objc static var black5: UIColor
    @TuxedoUIColor(valueColor: .black6) @objc static var black6: UIColor
    @TuxedoUIColor(valueColor: .black7) @objc static var black7: UIColor
    @TuxedoUIColor(valueColor: .black8) @objc static var black8: UIColor
}

// MARK: - Passthrough Semantic Colors

public extension UIColor {
    @TuxedoUIColor(semanticColor: .backgroundPrimary) @objc static var backgroundPrimary: UIColor
    @TuxedoUIColor(semanticColor: .backgroundRaised) @objc static var backgroundRaised: UIColor
    @TuxedoUIColor(semanticColor: .backgroundRecessed) @objc static var backgroundRecessed: UIColor

    @TuxedoUIColor(semanticColor: .foregroundPrimary) @objc static var foregroundPrimary: UIColor
    @TuxedoUIColor(semanticColor: .foregroundSecondary) @objc static var foregroundSecondary: UIColor
    @TuxedoUIColor(semanticColor: .foregroundDisabled) @objc static var foregroundDisabled: UIColor
    @TuxedoUIColor(semanticColor: .foregroundTint) @objc static var foregroundTint: UIColor

    @TuxedoUIColor(semanticColor: .bluePrimary) @objc static var bluePrimary: UIColor
    @TuxedoUIColor(semanticColor: .greenPrimary) @objc static var greenPrimary: UIColor
    @TuxedoUIColor(semanticColor: .yellowPrimary) @objc static var yellowPrimary: UIColor
    @TuxedoUIColor(semanticColor: .orangePrimary) @objc static var orangePrimary: UIColor
    @TuxedoUIColor(semanticColor: .redPrimary) @objc static var redPrimary: UIColor

    @TuxedoUIColor(semanticColor: .shadow) @objc static var shadow: UIColor
    @TuxedoUIColor(semanticColor: .overlayDark) @objc static var overlayDark: UIColor
    @TuxedoUIColor(semanticColor: .overlay) @objc static var overlay: UIColor
    @TuxedoUIColor(semanticColor: .alwaysWhite) @objc static var alwaysWhite: UIColor
}
