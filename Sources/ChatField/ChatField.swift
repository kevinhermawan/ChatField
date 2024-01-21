//
//  ChatField.swift
//
//
//  Created by Kevin Hermawan on 11/12/23.
//

import SwiftUI
import SwiftUIIntrospect

/// A SwiftUI view that provides a multiline, editable chat interface.
///
/// ``ChatField`` extends standard text input capabilities by offering multiline text support and is optimized for different platforms .
public struct ChatField<Footer: View>: View {
    private var titleKey: LocalizedStringKey
    @Binding private var message: String
    
    private var action: () -> Void
    private var footer: () -> Footer
    
    /// Initializes a ``ChatField`` with specified parameters.
    ///
    /// - Parameters:
    ///   - titleKey: A `LocalizedStringKey` representing the localized title of the chat field, indicating its functional purpose.
    ///   - message: A `Binding` to a `String` value representing the editable text in the chat field.
    ///   - action: A closure that is executed when the user submits the message.
    ///   - footer: A closure returning a `View` that represents the footer content below the chat field.
    public init(
        _ titleKey: LocalizedStringKey,
        message: Binding<String>,
        action: @escaping () -> Void,
        footer: @escaping () -> Footer
    ) {
        self.titleKey = titleKey
        self._message = message
        self.action = action
        self.footer = footer
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            #if os(iOS)
            TextField(titleKey, text: $message, axis: .vertical)
                .lineLimit(5)
                .onSubmit { action() }
            #elseif os(macOS)
            TextField(titleKey, text: $message, axis: .vertical)
                .introspect(.textField(axis: .vertical), on: .macOS(.v14)) { textField in
                    textField.lineBreakMode = .byWordWrapping
                }
                .onSubmit { macOS_action() }
            #endif
            
            footer()
                #if os(iOS)
                .font(.footnote)
                #elseif os(macOS)
                .font(.callout)
                #endif
                .foregroundStyle(.secondary)
        }
    }
    
    #if os(macOS)
    private func macOS_action() {
        if NSApp.currentEvent?.modifierFlags.contains(.shift) == true {
            message.appendNewLine()
        } else {
            action()
        }
    }
    #endif
}

#Preview {
    VStack {
        ChatField("Message", message: .constant("")) {
            
        } footer: {
            Text("Lorem ipsum dolor sit amet.")
        }
        .chatFieldStyle(.capsule)
    }
    .padding()
}
