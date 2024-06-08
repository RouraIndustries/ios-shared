//
//  UINavigationController-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

/// This extension allows custom back buttons to retain back swipe functionality by
/// ensuring that the interactive pop gesture recognizer works even with custom back buttons.
extension UINavigationController: UIGestureRecognizerDelegate {
    /// This method is called after the view controller has loaded its view hierarchy into memory.
    /// It sets the navigation controller as the delegate for the interactive pop gesture recognizer,
    /// allowing custom back buttons to retain the swipe-to-go-back functionality.
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    /// Asks the delegate if a gesture recognizer should begin interpreting touches.
    ///
    /// This method enables the interactive pop gesture recognizer only if the navigation controller
    /// has more than one view controller on its stack, allowing the swipe-to-go-back functionality to work
    /// only when there's a previous view controller to pop to.
    ///
    /// - Parameter gestureRecognizer: The gesture recognizer that initiated the query.
    /// - Returns: `true` if the gesture recognizer should begin interpreting touches, `false` otherwise.
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
