//
//  Constructible.swift
//  
//
//  Created by Christopher J. Roura on 2/7/24.
//

import Foundation

public protocol Constructible {
    /// Entry point for view setup after initialization (if any).
    func configureView()

    /// Entry point for subview setup after initialization (if any).
    func configureSubviews()

    /// Constructs the sub-layer hierarchy (if any).
    func constructSublayerHierarchy()

    /// Constructs the view hierarchy by calling 'addSubview' as needed.
    func constructSubviewHierarchy()

    /// Constructs and activates AutoLayout constraints
    func constructSubviewConstraints()

    /// Add any accessiblity traits or labels necessary to make the view accessible
    func constructAccessibility()
}

extension Constructible {
    /// Convenience method that invokes 'Constructable' methods in the correct order.
    /// Typically called in the 'init' of types that conform to the 'Constructible' protocol.
    public func construct() {
        configureView()
        configureSubviews()
        constructSublayerHierarchy()
        constructSubviewHierarchy()
        constructSubviewConstraints()
        constructAccessibility()
    }
}
