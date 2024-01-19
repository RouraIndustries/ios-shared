//
//  UIImageKey.swift
//
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

/// A protocol allowing us to tie together multiple enum types which will be accessible under `UIImageKey` specifying
/// lists of known image asset names including ones from the `SFSymbol` and `Tuxedo` icon libaries, and the local
/// `AssetCatalog`.
///
/// All `UIImageKey` enums must be backed by a `String` as its `RawValue` and implement `CodingKey` so that they can
/// uniformly provide a `.stringValue` representation of the case.
public protocol UIImageKeyProtocol: RawRepresentable, CodingKey, CaseIterable where RawValue == String {}

/// A top-level struct for `UIImageKey` enums, allowing us to namespace the key lists under a single global type.
public struct UIImageKey {}
