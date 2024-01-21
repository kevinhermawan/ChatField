# ChatField

A customizable, multiline text field for chat interfaces in SwiftUI.

## Overview

The `ChatField` struct enhances the standard SwiftUI text field by supporting multiline input and adapting to specific platform behaviors.

### iOS

On iOS, `ChatField` offers an expanded chat field experience, enabling multiline input with a specified line limit, thus catering to the requirements of chat-based applications.

### macOS

On macOS, `ChatField` is designed to enhance user interaction by allowing the insertion of new lines through `Shift+Enter`, aligning with the typical chat interface behavior on desktop platforms.

## Documentation

You can find the documentation here: [https://kevinhermawan.github.io/ChatField/documentation/chatfield](https://kevinhermawan.github.io/ChatField/documentation/chatfield)

## Installation

You can add `ChatField` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/ChatField.git", .upToNextMajor(from: "2.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/ChatField.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.
