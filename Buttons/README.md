## FlatButton

An easy-to-use `NSButton` subclass to support flat appearance.

![](Docs/flat-screenshot.png)

## NonDimmingButtonCell

Custom `NSButtonCell` implementation to customize text appearance in disabled state. By default `NSButton` dims its text when disabled, you can use `NonDimmingButtonCell` to prevent this.

![](Docs/enabled-toggle.gif)

## CustomPaddingButtonCell

Custom `NSButtonCell` implementation to customize the content padding within the button.

### Image hugging

You can specify the image hugging behavior by setting the cell's `imageHugsTitle` property.

![](Docs/hug.gif)
![](Docs/nohug.gif)

### Drawing the button's title

`CustomPaddingButtonCell` [overrides](https://github.com/jozsef-vesza/CocoaComponents/blob/master/Buttons/Sources/Buttons/CustomPaddingButtonCell.swift#L35) `titleRect(forBounds:)` to calculate the rectangle necessary for the title. If you're using `attributedTitle`, make sure the font is specified ([see example](https://github.com/jozsef-vesza/CocoaComponents/blob/master/Buttons/Example/ButtonsDemo/ButtonsDemo/ViewController.swift#L21)), otherwise the the calculations in this method will be incorrect.

## CustomPaddingButton

`CustomPaddingButton` returns the intrinsic content size based on `CustomPaddingButtonCell`'s size calculations.

See [ButtonsDemo](Example/ButtonsDemo) for a complete demo.
