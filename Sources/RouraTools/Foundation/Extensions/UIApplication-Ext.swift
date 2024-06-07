//
//  UIApplication-Ext.swift
//
//
//  Created by Christopher J. Roura on 3/28/24.
//

import UIKit

public extension UIApplication {
    /// CFBundleShortVersionString
    static var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }

    /// CFBundleVersion
    static var appBuild: String {
        Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }

    /// CFBundleShortVersionString (CFBundleVersion)
    static var versionBuild: String {
        String(format: "%@ (%@)", appVersion, appBuild)
    }

    /// CFBundleIdentifier
    static var bundleId: String {
        Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String ?? ""
    }
}
