// Copyright © 2023 Ben Morrison. All rights reserved.

import SwiftUI

#if canImport(AppKit)
import AppKit

typealias PlatformColor = NSColor
#endif

#if canImport(UIKit)
import UIKit

typealias PlatformColor = UIColor

extension Color {
    init(_ uiColor: UIColor) {
        self.init(uiColor: uiColor)
    }
}
#endif

extension Color {
    /// Creates color that responds to light or dark mode for device
    ///
    /// - Note: Unknown modes are defaulted to `lightMode`
    /// - Parameters:
    ///   - lightMode: The color to use when the `userInterfaceStyle` is light mode or unknown
    ///   - darkMode: The color to use when the `userInterfaceStyle` is dark mode
    public init(lightMode: Color, darkMode: Color) {
        self.init(pallet: .init(
            normalContrast: .init(light: lightMode, dark: darkMode),
            highContrast: nil
        ))
    }
    
    public init(pallet: ColorsPallet) {
        self.init(PlatformColor(pallet: pallet))
    }
}
