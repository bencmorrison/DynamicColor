# DynamicColor

A programatic way to create dynamic colors with SwiftUI's `Color`

```swift
// Create a `Color` where when light mode is enabled it is red
// and when dark mode is enabled it is blue.
let colorPallet = ColorsPallet(
    normalContrast: .init(light: .red, dark: .blue),
    highContrast: .init(light: .purple, dark: .orange)
)
// Creates a color with the dynamic colors listed
let multiModeColor = Color(pallet: colorPallet)
```
