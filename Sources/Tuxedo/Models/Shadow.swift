//
//  Shadow.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

// MARK: - Components
internal extension Shadow {

    struct Components: Equatable, ShadowProperties {

        let offset: CGSize
        let xOffset: CGFloat
        let yOffset: CGFloat
        let radius: CGFloat
        let blur: CGFloat
        let cgColor: CGColor
        let opacity: Float
        let description: String

        /// Initialize using custom properties.
        init(xOffset: CGFloat, yOffset: CGFloat, blur: CGFloat, color: UIColor) {
            self.init(
                xOffset: xOffset,
                yOffset: yOffset,
                blur: blur,
                cgColor: color.cgColor,
                opacity: 1.0
            )
        }

        /// Initialize using a referenced `UIView`, by extracting the values assigned to the underlying `CGLayer`.
        ///
        /// This initializer is currently only needed for providing a getter for the `UIView.shadowComponents` property.
        init(view: UIView) {
            self.init(
                xOffset: view.layer.shadowOffset.width,
                yOffset: view.layer.shadowOffset.height,
                blur: view.layer.shadowRadius * 2.0,
                cgColor: view.layer.shadowColor ?? UIColor.clear.cgColor,
                opacity: view.layer.shadowOpacity
            )
        }

        /// Initialize using the most broad set of configurable properties.
        private init(xOffset: CGFloat, yOffset: CGFloat, blur: CGFloat, cgColor: CGColor, opacity: Float) {

            offset = CGSize(width: xOffset, height: yOffset)
            self.xOffset = xOffset
            self.yOffset = yOffset
            radius = blur / 2.0
            self.blur = blur
            self.cgColor = cgColor
            self.opacity = opacity
            description = "x: \(xOffset), y: \(yOffset), blur: \(blur)"
        }
    }
}
