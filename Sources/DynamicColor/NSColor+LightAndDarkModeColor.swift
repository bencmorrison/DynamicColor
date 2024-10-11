// Copyright © 2023 Ben Morrison. All rights reserved.

#if canImport(AppKit)

import AppKit
import SwiftUI

extension NSColor {
    /// A wrapper around the `init(dynamicProvider:)` function to make
    /// setting light and dark mode colors easier. While allowing us to use
    /// the `Color` struct for initalisation
    ///
    /// - Note: Unknown modes are defaulted to `lightMode`
    /// - Parameters:
    ///   - lightMode: The color to use when the `userInterfaceStyle` is `aqua` or unknown
    ///   - darkMode: The color to use when the `userInterfaceStyle` is `darkAqua`
    public convenience init(lightMode: Color, darkMode: Color) {
        self.init(pallet: .init(
            normalContrast: .init(
                any: lightMode,
                light: lightMode,
                dark: darkMode),
            highContrast: nil
        ))
    }
    
    /// A wrapper around the `init(dynamicProvider:)` function to make
    /// setting the various colors for the various modes.
    /// Ex: Normal contrast light mode, or high contrast dark mode.
    ///
    /// - Parameters:
    ///   - pallet: The color pallet to use for the defined color
    public convenience init(pallet: ColorsPallet) {
        self.init(name: nil) { appearance in
            let contrast = ColorContrast(appearance)
            let luminosity = ColorLuminosity(appearance)
            let color = pallet.colorFor(contrast: contrast, luminosity: luminosity)
            return NSColor(color)
        }
    }
    
    /// A wrapper around the `init(name:, dynamicProvider:)` function to make
    /// setting light and dark mode colors easier.
    ///
    /// - Note: Unknown modes are defaulted to `lightMode`
    /// - Parameters:
    ///   - lightMode: The color to use when the `userInterfaceStyle` is `aqua`  or unknown
    ///   - darkMode: The color to use when the `userInterfaceStyle` is `darkAqua`
    public convenience init(lightMode: NSColor, darkMode: NSColor) {
        self.init(pallet: .init(
            normalContrast: .init(light: Color(lightMode), dark: Color(darkMode)),
            highContrast: nil
        ))
    }
}

#endif
