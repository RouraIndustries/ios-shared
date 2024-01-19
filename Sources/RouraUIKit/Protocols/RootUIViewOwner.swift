//
//  RootUIViewOwner.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit
import RouraUIKit

public protocol RootUIViewOwner {
    /// The type of the root view.
    associatedtype RootViewType: BaseUIView

    /// The root view of a view hierarchy.
    var rootView: RootViewType { get }

    /// Returns the root view if loaded, nil if not.
    var rootViewIfLoaded: RootViewType? { get }
}

public extension RootUIViewOwner where Self: UIViewController {
    var rootView: RootViewType { view as! RootViewType }
    var rootViewIfLoaded: RootViewType? { viewIfLoaded as? RootViewType }
}
