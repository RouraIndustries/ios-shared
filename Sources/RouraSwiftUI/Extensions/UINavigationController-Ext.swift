//
//  UINavigationController-Ext.swift
//
//
//  Created by Christopher J. Roura on 1/19/24.
//

import UIKit

// This extension allows custom back buttons to retain back swipe functionality
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
