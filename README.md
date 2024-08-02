# ChatField

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkevinhermawan%2FChatField%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/kevinhermawan/ChatField) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkevinhermawan%2FChatField%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/kevinhermawan/ChatField)

A versatile, multiline text input component for chat interfaces in SwiftUI.

## Overview

The `ChatField` struct provides an enhanced text input experience tailored for chat applications in SwiftUI. It extends beyond the standard SwiftUI text field by offering multiline input capabilities and platform-specific adaptations.

### iOS Specifics

On iOS, `ChatField` expands to accommodate multiline input with a customizable line limit, meeting the needs of mobile chat applications.

### macOS Specifics

For macOS, `ChatField` is engineered to support desktop chat conventions. It allows users to insert new lines using `Shift+Enter`, maintaining a familiar desktop chat interface behavior.

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
