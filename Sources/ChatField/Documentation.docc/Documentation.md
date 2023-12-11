# ``ChatField``

A customizable, multiline text field for chat interfaces in SwiftUI.

## Overview

The ``ChatField`` struct enhances the standard SwiftUI text field by supporting multiline input and adapting to specific platform behaviors.

### iOS Specifics

On iOS, ``ChatField`` provides a multiline text field with a line limit.

### macOS Specifics

On macOS, ``ChatField`` allows the insertion of new lines using `Shift+Enter`.

## Usage

```swift
@State var text: String = ""

var body: some View {
    ChatField("Message", text: $text) {
        // Action to perform on text submission
    }
    .textFieldStyle(CapsuleChatFieldStyle())
}
```
