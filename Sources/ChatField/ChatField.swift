//
//  ChatField.swift
//
//
//  Created by Kevin Hermawan on 11/12/23.
//

import SwiftUI
import SwiftUIIntrospect

/// A control that displays an editable text interface for chat purposes.
///
/// ``ChatField`` extends standard text field capabilities with multiline input and specific behaviors for different platforms.
public struct ChatField: View {
    private var titleKey: LocalizedStringKey
    @Binding private var text: String
    private var action: () -> Void
    
    /// Creates a text field with a text label generated from a localized title string.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field, describing its purpose.
    ///   - text: The text to display and edit.
    ///   - action: The action to execute upon text submission.
    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        action: @escaping () -> Void
    ) {
        self.titleKey = titleKey
        self._text = text
        self.action = action
    }
    
    public var body: some View {
        #if os(iOS)
        TextField(titleKey, text: $text, axis: .vertical)
            .lineLimit(5)
            .onSubmit { action() }
        #elseif os(macOS)
        TextField(titleKey, text: $text, axis: .vertical)
            .introspect(.textField(axis: .vertical), on: .macOS(.v14)) { textField in
                textField.lineBreakMode = .byWordWrapping
            }
            .onSubmit { macOS_action() }
        #endif
    }
    
    #if os(macOS)
    private func macOS_action() {
        if NSApp.currentEvent?.modifierFlags.contains(.shift) == true {
            text.appendNewLine()
        } else {
            action()
        }
    }
    #endif
}

#Preview {
    @State var text = ""
    
    return NavigationStack {
        ChatField("Message", text: $text, action: {})
            .textFieldStyle(CapsuleChatFieldStyle())
            .padding()
    }
}
