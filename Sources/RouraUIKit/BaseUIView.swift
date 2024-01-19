//
//  BaseUIView.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

open class BaseUIView: UIView {
    // MARK: Initialization

    override public init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        construct()
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

@objc
extension BaseUIView: Constructible {
    open func configureView() { /* No-Op: Override in inheriting class */ }
    open func configureSubviews() { /* No-Op: Override in inheriting class */ }
    open func constructSubviewConstraints() { /* No-Op: Override in inheriting class */ }
    open func constructSublayerHierarchy() { /* No-Op: Override in inheriting class */ }
    open func constructSubviewHierarchy() { /* No-Op: Override in inheriting class */ }
    open func constructAccessibility() { /* No-Op: Override in inheriting class */ }
}
