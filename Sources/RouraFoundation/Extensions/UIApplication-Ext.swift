//
//  UIApplication-Ext.swift
//
//
//  Created by Christopher J. Roura on 3/28/24.
//

import UIKit

public extension UIApplication {

    /// The version number of the application.
    ///
    /// This retrieves the value from the `CFBundleShortVersionString` key in the app's `Info.plist` file.
    ///
    /// - Returns: A `String` representing the app's version number. If the key is not found, it returns an empty string.
    ///
    /// # Usage
    /// ```
    /// let version = UIApplication.appVersion
    /// print("App Version: \(version)")
    /// ```
    static var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }

    /// The build number of the application.
    ///
    /// This retrieves the value from the `CFBundleVersion` key in the app's `Info.plist` file.
    ///
    /// - Returns: A `String` representing the app's build number. If the key is not found, it returns an empty string.
    ///
    /// # Usage
    /// ```
    /// let build = UIApplication.appBuild
    /// print("App Build: \(build)")
    /// ```
    static var appBuild: String {
        Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
    }

    /// The combined version and build number of the application.
    ///
    /// This combines the app version and build number in the format "version (build)".
    ///
    /// - Returns: A `String` representing the combined version and build number.
    ///
    /// # Usage
    /// ```
    /// let versionBuild = UIApplication.versionBuild
    /// print("App Version and Build: \(versionBuild)")
    /// ```
    static var versionBuild: String {
        String(format: "%@ (%@)", appVersion, appBuild)
    }

    /// The bundle identifier of the application.
    ///
    /// This retrieves the value from the `CFBundleIdentifier` key in the app's `Info.plist` file.
    ///
    /// - Returns: A `String` representing the app's bundle identifier. If the key is not found, it returns an empty string.
    ///
    /// # Usage
    /// ```
    /// let bundleIdentifier = UIApplication.bundleId
    /// print("Bundle Identifier: \(bundleIdentifier)")
    /// ```
    static var bundleId: String {
        Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String ?? ""
    }
}
