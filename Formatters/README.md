## LengthLimitingFormatter

LengthLimitingFormatter is a custom `Formatter` subclass to support limiting text length in `NSTextField`.

### Usage
```swift
// 1. Create a formatter instance
let formatter = LengthLimitingFormatter()
let inputField = NSTextField()
// 2. Set it as the formatter of your text field
inputField.formatter = formatter
// 3. Set the maximum allowed input length
formatter.maxLength = 10
```

## DateInputFormatter

DateInputFormatter is a custom `Formatter` subclass to limit text input to dates in `NSTextField`.

### Usage
```swift
// 1. Create a formatter instance
let dateInputFormatter = DateInputFormatter()
let inputField = NSTextField()
// 2. Set it as the formatter of your text field
dateInputField.formatter = dateInputFormatter
// 3. Set the preferred date format
dateInputFormatter.dateFormat = "MMM"
```

See [Example](Example) for a complete demo.
