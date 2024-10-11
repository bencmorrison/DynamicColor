// Copyright © 2023 Ben Morrison. All rights reserved.

#if canImport(UIKit)

import UIKit
import SwiftUI

extension UIColor {
    /// A wrapper around the `init(dynamicProvider:)` function to make
    /// setting light and dark mode colors easier. While allowing us to use
    /// the `Color` struct for initalisation
    ///
    /// - Note: Unknown modes are defaulted to `lightMode`
    /// - Parameters:
    ///   - lightMode: The color to use when the `userInterfaceStyle` is `light` or unknown
    ///   - darkMode: The color to use when the `userInterfaceStyle` is `dark`
    public convenience init(lightMode: Color, darkMode: Color) {
        self.init(
            lightMode: UIColor(lightMode),
            darkMode: UIColor(darkMode)
        )
    }
    
    /// A wrapper around the `init(dynamicProvider:)` function to make
    /// setting the various colors for the various modes.
    /// Ex: Normal contrast light mode, or high contrast dark mode.
    ///
    /// - Parameters:
    ///   - pallet: The color pallet to use for the defined color
    public convenience init(pallet: ColorsPallet) {
        self.init{ traitCollection in
            let contrast = ColorContrast(traitCollection: traitCollection)
            let luminosity = ColorLuminosity(traitCollection: traitCollection)
            let color = pallet.colorFor(contrast: contrast, luminosity: luminosity)
            return UIColor(color)
        }
    }
    
    /// A wrapper around the `init(dynamicProvider:)` function to make
    /// setting light and dark mode colors easier.
    ///
    /// - Note: Unknown modes are defaulted to `lightMode`
    /// - Parameters:
    ///   - lightMode: The color to use when the `userInterfaceStyle` is `light`  or unknown
    ///   - darkMode: The color to use when the `userInterfaceStyle` is `dark`
    public convenience init(lightMode: UIColor, darkMode: UIColor) {
        self.init(pallet: .init(
            normalContrast: .init(light: Color(lightMode), dark: Color(darkMode)),
            highContrast: nil
        ))
    }
}

#endif
