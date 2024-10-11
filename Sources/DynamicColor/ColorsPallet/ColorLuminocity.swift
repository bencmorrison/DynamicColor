// Copyright © 2024 Ben Morrison. All rights reserved.

enum ColorLuminosity {
    case any, light, dark
}

#if canImport(AppKit)
import AppKit

extension ColorLuminosity {
    init(_ appearance: NSAppearance) {
        switch appearance.name {
        case .aqua, .darkAqua:
            self = .any
        case .vibrantLight, .vibrantLight:
            self = .light
        case .accessibilityHighContrastAqua, .accessibilityHighContrastVibrantLight:
            self = .any
        case .accessibilityHighContrastDarkAqua, .accessibilityHighContrastVibrantDark:
            self = .dark
        default:
            self = .any
        }
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension ColorLuminosity {
    init(traitCollection: UITraitCollection) {
        switch traitCollection.userInterfaceStyle {
        case .light:
            self = .light
        case .dark:
            self = .dark
        case .unspecified:
            self = .any
        @unknown default:
            self = .any
        }
    }
}
#endif
