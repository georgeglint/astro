// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   Astro
  /// 
  ///   Created by George Leadbeater on 29/01/2023.
  internal static let aApply = L10n.tr("Localizable", "a_apply", fallback: "Apply")
  /// Clear
  internal static let aClear = L10n.tr("Localizable", "a_clear", fallback: "Clear")
  /// Filter
  internal static let aFilter = L10n.tr("Localizable", "a_filter", fallback: "Filter")
  /// View
  internal static let aView = L10n.tr("Localizable", "a_view", fallback: "View")
  /// All
  internal static let dAll = L10n.tr("Localizable", "d_all", fallback: "All")
  /// Astronauts
  internal static let dAstronauts = L10n.tr("Localizable", "d_astronauts", fallback: "Astronauts")
  /// Bio:
  internal static let dBio = L10n.tr("Localizable", "d_bio", fallback: "Bio:")
  /// Date of Birth:
  internal static let dDateOfBirth = L10n.tr("Localizable", "d_date_of_birth", fallback: "Date of Birth:")
  /// Filter
  internal static let dFilter = L10n.tr("Localizable", "d_filter", fallback: "Filter")
  /// Type
  internal static let dType = L10n.tr("Localizable", "d_type", fallback: "Type")
  /// Instagram
  internal static let nInstagram = L10n.tr("Localizable", "n_instagram", fallback: "Instagram")
  /// Twitter
  internal static let nTwitter = L10n.tr("Localizable", "n_twitter", fallback: "Twitter")
  /// Wikipedia
  internal static let nWikipedia = L10n.tr("Localizable", "n_wikipedia", fallback: "Wikipedia")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
