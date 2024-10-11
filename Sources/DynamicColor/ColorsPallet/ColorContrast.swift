// Copyright © 2024 Ben Morrison. All rights reserved.

enum ColorContrast {
    case normal, high
}

#if canImport(AppKit)
import AppKit

extension ColorContrast {
    init(_ appearance: NSAppearance) {
        switch appearance.name {
        case .aqua, .darkAqua:
            self = .normal
        default:
            self = .high
        }
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension ColorContrast {
    init(traitCollection: UITraitCollection) {
        switch traitCollection.accessibilityContrast {
        case .normal:
            self = .normal
        case .high:
            self = .high
        case .unspecified:
            self = .normal
        @unknown default:
            self = .normal
        }
    }
}
#endif
