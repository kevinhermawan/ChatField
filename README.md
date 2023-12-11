# ChatField

A customizable, multiline text field for chat interfaces in SwiftUI.

## Overview

The `ChatField` struct enhances the standard SwiftUI text field by supporting multiline input and adapting to specific platform behaviors.

### iOS Specifics

On iOS, `ChatField` provides a multiline text field with a line limit.

### macOS Specifics

On macOS, `ChatField` allows the insertion of new lines using `Shift+Enter`.

## Documentation

You can find the documentation here: [https://kevinhermawan.github.io/ChatField/documentation/chatfield](https://kevinhermawan.github.io/ChatField/documentation/chatfield)

## Installation

You can add `ChatField` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/ChatField.git", .upToNextMajor(from: "1.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/ChatField.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.
