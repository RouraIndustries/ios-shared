//
//  UITraitCollection-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

// MARK: - Convenience Flags
public extension UITraitCollection {

    var isHighContrastEnabled: Bool { accessibilityContrast == .high }
    var isDarkModeEnabled: Bool { userInterfaceStyle == .dark }
}
