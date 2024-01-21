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
/// ``ChatField`` enhances standard input capabilities with multiline chat support and adapts to specific platform requirements.
public struct ChatField<Footer: View>: View {
    private var titleKey: LocalizedStringKey
    @Binding private var text: String
    
    private var action: () -> Void
    private var footer: () -> Footer
    
    /// Initializes a ``ChatField`` with specified parameters.
    ///
    /// - Parameters:
    ///   - titleKey: A `LocalizedStringKey` for the localized title of the chat field, describing its purpose.
    ///   - text: A binding to the text value to be displayed and edited.
    ///   - action: A closure executed when the user submits the text.
    ///   - footer: A closure returning the content for the footer below the chat field.
    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        action: @escaping () -> Void,
        footer: @escaping () -> Footer
    ) {
        self.titleKey = titleKey
        self._text = text
        self.action = action
        self.footer = footer
    }
    
    public var body: some View {
        VStack(spacing: 8) {
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
            text.appendNewLine()
        } else {
            action()
        }
    }
    #endif
}

#Preview {
    VStack {
        ChatField("Message", text: .constant("")) {
            
        } footer: {
            Text("Lorem ipsum dolor sit amet.")
        }
        .textFieldStyle(CapsuleChatFieldStyle())
    }
    .padding()
}
