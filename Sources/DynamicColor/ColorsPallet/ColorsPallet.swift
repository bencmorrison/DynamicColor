// Copyright © 2024 Ben Morrison. All rights reserved.

import SwiftUI

/// Defines the multiple colors that we expect for dynamic colors
/// and accessibility.
public struct ColorsPallet {
    /// Defines a 'group' of colors that will be used for either normal or
    /// high contrast color groups.
    public struct ColorGroup {
        /// Any is what is used for any situations when not defined.
        /// In this case when nil, the light mode color is used.
        public let any: Color?
        /// The light mode version of the color.
        public let light: Color
        /// The dark mode version of the color.
        public let dark: Color
        
        public init(any: Color? = nil, light: Color, dark: Color) {
            self.any = any
            self.light = light
            self.dark = dark
        }
    }

    /// The colors to use when the application is in normal contrast mode.
    public let normalContrast: ColorGroup
    /// The colors to use when the application is in high contrast mode.
    /// When nil, all normal contrast colors are used.
    public let highContrast: ColorGroup?
    
    /// Creates a color pallet from the provided ColorGroups
    public init(normalContrast: ColorGroup, highContrast: ColorGroup?) {
        self.normalContrast = normalContrast
        self.highContrast = highContrast
    }
    
    func colorFor(contrast: ColorContrast, luminosity: ColorLuminosity) -> Color {
        switch (contrast, luminosity) {
        case (.normal, .light): return normalContrast.light
        case (.normal, .dark): return normalContrast.dark
        case (.normal, .any): return normalContrast.any ?? normalContrast.light
        case (.high, .light): return highContrast?.light ?? normalContrast.light
        case (.high, .dark): return highContrast?.dark ?? normalContrast.dark
        case (.high, .any): return highContrast?.any ?? normalContrast.any ?? normalContrast.light
        }
    }
}
