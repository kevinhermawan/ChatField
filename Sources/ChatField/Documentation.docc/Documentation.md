# `ChatField`

A versatile, multiline text input component for chat interfaces in SwiftUI.

## Overview

The ``ChatField`` struct provides an enhanced text input experience tailored for chat applications in SwiftUI. It extends beyond the standard SwiftUI text field by offering multiline input capabilities and platform-specific adaptations.

### iOS Specifics

On iOS, ``ChatField`` expands to accommodate multiline input with a customizable line limit, meeting the needs of mobile chat applications.

### macOS Specifics

For macOS, ``ChatField`` is engineered to support desktop chat conventions. It allows users to insert new lines using `Shift+Enter`, maintaining a familiar desktop chat interface behavior.

## Example Usage

Here's how you can implement a ``ChatField`` with custom accessories and a footer:

```swift
ChatField("Message", text: $messageText) {
    sendMessage()
} leadingAccessory: {
    Button(action: attachFile) {
        Image(systemName: "paperclip")
    }
} trailingAccessory: {
    Button(action: sendMessage) {
        Image(systemName: "arrow.up.circle.fill")
    }
} footer: {
    Text("Typing indicator or other info")
}
.chatFieldStyle(.capsule)
```
