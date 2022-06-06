# Slime

A button pressed like a slime blob.

## Usage

```swift
SlimeButton(title: String, scale: CGFloat, blobColor: Color, titleColor: Color, speed: SlimeButton.BlobSpeed, loop: Bool, action:(() -> Void)?)
```

- `title` is a String type that adds text for a button. Default value is a blank string.
- `scale` is a CGFloat type that helps to scale the size of the button. Default value is 1.0.
- `blobColor` is a SwiftUI.Color type that decides the color for the button's blob. Default value is Color.yellow.
- `titleColor` is a SwiftUI.Color type that decides the color for the button's text. Default value is Color.red.
- `speed` is an enum type that determines the speed of the fluctuating blob. Default value is BlobSpeed.normal.
- `loop` is a boolean that decides whether the blob fluctuates without being pressed. Default value is false.
- `action` is a closure that executes after the button is pressed. Default value is nil.
- You can always omit each parameter or put nil for the action.

### Example code

```swift
import SwiftUI

struct ExampleView: View {
  var body: some View {
    SlimeButton(title: "Slime", scale: 1.5, blobColor: .red, titleColor: .yellow, speed: .slow, loop: true) {
      print("Fluctuating")
    }
  }
}
```

### Example result

![usage](https://user-images.githubusercontent.com/9366677/172169721-b8142853-5a99-4c96-832c-77cef2f7be15.gif)

## Use cases

- [Pocus - Focus to make money](https://apple.co/3PBffgX)

![use-case-1](https://user-images.githubusercontent.com/9366677/172167653-45917971-8a8d-4723-9601-198e1309d938.gif)
