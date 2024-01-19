//
//  ReusableCell.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

public protocol ReusableCell: AnyObject {
    static var identifier: String { get }
}

public extension ReusableCell {
    static var identifier: String {
        String(describing: self)
    }
}
