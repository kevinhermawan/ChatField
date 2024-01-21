# ``ChatField``

A customizable, multiline text field for chat interfaces in SwiftUI.

## Overview

The ``ChatField`` struct enhances the standard SwiftUI text field by supporting multiline input and adapting to specific platform behaviors.

### iOS

On iOS, ``ChatField`` offers an expanded chat field experience, enabling multiline input with a specified line limit, thus catering to the requirements of chat-based applications.

### macOS

On macOS, ``ChatField`` is designed to enhance user interaction by allowing the insertion of new lines through `Shift+Enter`, aligning with the typical chat interface behavior on desktop platforms.

## Usage

```swift
@State var text: String = ""

var body: some View {
    ChatField("Message", text: $text) {
        // Define the action to perform upon text submission
    } footer: {
        Text("This is footer")
    }
    .textFieldStyle(CapsuleChatFieldStyle())
}
```
