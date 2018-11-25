# InputFields

A collection of various input field implementations to use in Cocoa apps.

## FocusCheckingTextField

`NSTextField` notifies its delegate via `controlTextDidBeginEditing(_:)` when users start typing in a text field. The default implementation is not very useful if some custom highlighting behavior is needed when the field gains focus (before any typing happens). `FocusCheckingTextField` aims to help in this specific use case.

### Under the hood

When text fields get input focus, they do not actually become first responders right away. The window has a single field editor, which is shared between all the text fields within that window. The window puts text fields in focus by assigning the field editor to them.

`FocusCheckingTextField` leverages this behavior: it queries whether it has a field editor assigned. Once it has the field editor, it will senf `controlTextDidBeginEditing(_:)` to its delegate (just as a regular text field would), so it can react to the focus change.

See [InputFieldsDemo](Example/InputFieldsDemo) for a concrete example.

