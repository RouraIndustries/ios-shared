//
//  UIImageKey-Helpers.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

// MARK: - SFSymbol Keys

public extension UIImageKey {
    /// A list of keys from the built-in `SFSymbol` icon library which we intend to use in the apps.
    ///
    /// Best Practices:
    /// * Please always use a literal translation of the icon name as its case definition, instead of
    /// referring to its use case (i.e. `case swift` instead of `case swiftUITabBarIcon`).
    /// * All cases which match the `rawValue` 1:1 should omit an explicit `rawValue` (i.e. `case swift` instead of
    /// `case swift = "swift"`).
    ///
    /// > NOTE: Not all SFSymbols exist across all OS versions. As you're adding new symbols here, be sure to run the
    /// unit tests in `UIImasgeKeyTests` on a simulator matching the lowest minimum deployment target in place across
    /// our apps to ensure that all keys exist across all possible versions. By default, our unit tests in the build
    /// pipeline currently only run against the latest simulator.
    enum SFSymbol: String, UIImageKeyProtocol {
        case exclamationmarkTriangle = "exclamationmark.triangle"
        case sliderHorizontalBelowSquareFillAndSquare = "slider.horizontal.below.square.fill.and.square"
        case swift
        case photo
        case chevronRight = "chevron.right"
        case infoCircle = "info.circle"
        case checkmarkCircle = "checkmark.circle"
    }
}

// MARK: - Tuxedo Image Keys

public extension UIImageKey {
    /// A list of keys from our design system's `Tuxedo` icon library.
    ///
    /// Best Practices:
    /// * Please always use a literal translation of the icon name as its case definition, instead of
    /// referring to its use case (i.e. `case bell` instead of `case notificationBarButtonIcon`).
    /// * All cases which match the `rawValue` 1:1 should omit an explicit `rawValue` (i.e. `case bell` instead of
    /// `case bell = "bell"`).
    enum Tuxedo: String, UIImageKeyProtocol {
        case arrowDownFilled
        case camera
        case caretRight
        case chatBubble
        case info20
        case phone
        case xMarkFill
    }
}
