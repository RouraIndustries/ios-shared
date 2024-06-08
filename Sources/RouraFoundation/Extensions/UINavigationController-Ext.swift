//
//  UINavigationController-Ext.swift
//
//
//  Created by Christopher J. Roura on 6/7/24.
//

import UIKit

// This extension allows custom back buttons to retain back swipe functionality
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
