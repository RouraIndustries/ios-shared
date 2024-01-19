//
//  SwiftUIView.swift
//  
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

public enum SemanticColor: CaseIterable {
    case backgroundPrimary
    case backgroundRaised
    case backgroundRecessed

    case foregroundPrimary
    case foregroundSecondary
    case foregroundDisabled
    case foregroundTint

    case bluePrimary
    case greenPrimary
    case yellowPrimary
    case orangePrimary
    case redPrimary

    case shadow
    case overlayDark
    case overlay
    case alwaysWhite
}

// MARK: - Descriptors

public extension SemanticColor {
    var name: String {
        String(describing: self)
    }

    func description(for traitCollection: UITraitCollection) -> String {
        semanticComponents(for: traitCollection).description(for: traitCollection)
    }
}

// MARK: - Components

internal extension SemanticColor {
    struct Components {
        private let lightValue: ValueColor
        private let lightAlpha: UIColorAlphaComponent
        private let darkValue: ValueColor
        private let darkAlpha: UIColorAlphaComponent

        var lightValueComponents: ValueColor.Components {
            lightValue.components.opacity(lightAlpha)
        }
        var darkValueComponents: ValueColor.Components {
            darkValue.components.opacity(darkAlpha)
        }

        init(
            lightValue: ValueColor,
            lightAlpha: UIColorAlphaComponent = 1.0,
            darkValue: ValueColor,
            darkAlpha: UIColorAlphaComponent = 1.0
        ) {
            self.lightValue = lightValue
            self.lightAlpha = lightAlpha
            self.darkValue = darkValue
            self.darkAlpha = darkAlpha
        }

        func description(for traitCollection: UITraitCollection) -> String {
            let valueColor = traitCollection.isDarkModeEnabled ? darkValue : lightValue
            let components = traitCollection.isDarkModeEnabled ? darkValueComponents : lightValueComponents

            return String(format: "%@: %@", valueColor.name, components.description)
        }
    }

    func semanticComponents(for traitCollection: UITraitCollection) -> Components {
        traitCollection.isHighContrastEnabled ? highContrast : normalContrast
    }

    func valueComponents(for traitCollection: UITraitCollection) -> ValueColor.Components {
        let semanticComponents = semanticComponents(for: traitCollection)
        return traitCollection.isDarkModeEnabled ? semanticComponents.darkValueComponents : semanticComponents.lightValueComponents
    }
}

// MARK: - Definitions

internal extension SemanticColor {
    var normalContrast: Components {
        switch self {
        case .backgroundPrimary: return Components(
            lightValue: .white,
            darkValue: .black3
        )
        case .backgroundRaised: return Components(
            lightValue: .white,
            darkValue: .black4
        )
        case .backgroundRecessed: return Components(
            lightValue: .grey7,
            darkValue: .black2
        )
        case .foregroundPrimary: return Components(
            lightValue: .black4,
            darkValue: .grey7
        )
        case .foregroundSecondary: return Components(
            lightValue: .grey1,
            darkValue: .grey4
        )
        case .foregroundDisabled: return Components(
            lightValue: .grey3,
            darkValue: .black7
        )
        case .foregroundTint: return Components(
            lightValue: .grey6,
            darkValue: .black5
        )
        case .bluePrimary: return Components(
            lightValue: .blue2,
            darkValue: .blue3
        )
        case .greenPrimary: return Components(
            lightValue: .green1,
            darkValue: .green3
        )
        case .yellowPrimary: return Components(
            lightValue: .yellow1,
            darkValue: .yellow3
        )
        case .orangePrimary: return Components(
            lightValue: .orange1,
            darkValue: .orange1
        )
        case .redPrimary: return Components(
            lightValue: .red1,
            darkValue: .red3
        )
        case .shadow: return Components(
            lightValue: .black1, lightAlpha: 0.16,
            darkValue: .black0, darkAlpha: 0.95
        )
        case .overlayDark: return Components(
            lightValue: .black4, lightAlpha: 0.16,
            darkValue: .black0, darkAlpha: 0.75
        )
        case .overlay: return Components(
            lightValue: .white, lightAlpha: 0.9,
            darkValue: .black3, darkAlpha: 0.9
        )
        case .alwaysWhite: return Components(
            lightValue: .white,
            darkValue: .white
        )
        }
    }

    var highContrast: Components {
        switch self {
        case .bluePrimary: return Components(
            lightValue: .blue1,
            darkValue: .blue3
        )

        default:
            return normalContrast
        }
    }
}
