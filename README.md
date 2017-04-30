# NativePopup

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Clone of Apple iOS AppStore review feedback popup.

NativePopup clones native popup's design and behavior(animation and user interaction).
And you can use custom image and emoji in addition to bad/good icons.

## Original

Good | Bad
--- | ---
![good](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/Original/good.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/Original/bad.png)

## NativePopup

## Good/Bad

Good | Bad 
--- | --- 
![good](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/good.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/bad.png)

## Custom Image/Emoji

Custom Image | Emoji
--- | ---
![custome image](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/custom_image.png) | ![bad](https://raw.githubusercontent.com/mono0926/NativePopup/master/Screenshots/NativePopup/emoji.png)

# Usage

Very simple to use NativePopup🐶


```swift
// Good
NativePopup.show(image: NativePopup.Preset.Feedback.good,
                 title: "Helpful",
                 message: "Thanks for your feedback.")
// Bad
NativePopup.show(image: NativePopup.Preset.Feedback.bad,
                 title: "Not Helpful",
                 message: "Thanks for your feedback.")
// Custom Image
NativePopup.show(image: UIImage(named: "love")!,
                 title: "参考になった",
                 message: "フィードバックをありがとう\nございました。")
// Emoji
NativePopup.show(image: Character("🐶"),
                 title: "イッヌ",
                 message: "絵文字対応したワン")
// Title only
NativePopup.show(image: NativePopup.Preset.Feedback.good,
                 title: "Empty Message 🗑",
                 message: nil)
// Custom duration (default duration is 1.5 seconds)
NativePopup.show(image: Character("🔟"),
                    title: "10 seconds",
                    message: "Long duration🙇",
                    duration: 10)
```


`image` accepts `ImageConvertible` protocol.

```swift
public enum Image {
    case image(UIImage)
    case emoji(Character)

    func validate() {
        switch self {
        case .image(let image):
            assert(image.size.width == image.size.height, "Aspect ratio should be 1:1.")
        case .emoji:
            // MEMO: should check?
            break
        }
    }
}

public protocol ImageConvertible {
    var image: Image { get }
}
```

`UIImage` and `Character` conforms to `ImageConvertible` by default.

```swift
extension UIImage: ImageConvertible {
    public var image: Image { return .image(self) }
}

extension Character: ImageConvertible {
    public var image: Image { return .emoji(self) }
}
```

You can define custom preset image as below.

```swift
extension NativePopup {
    public struct Preset {
        private init() {}
        public enum Feedback: String, ImageConvertible {
            case
            good,
            bad

            public var image: Image {
                return .image(UIImage.init(nativePopupNamed: "feedback_\(rawValue)"))
            }
        }
    }
}
```

**Image size should be 112 x 112.**

# Installation

You can install by [Carthage](https://github.com/Carthage/Carthage) or add [NativePopup sources](https://github.com/mono0926/NativePopup/tree/master/NativePopup) manually.

## [Carthage](https://github.com/Carthage/Carthage)

Add this to Cartfile

```
github "mono0926/NativePopup"
```

```sh
$ carthage update
```
