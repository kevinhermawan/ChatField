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
/// - Parameters:
///   - titleKey: A localized string key for the placeholder text.
///   - text: A binding to the text entered by the user.
///   - action: A closure to be executed when the user submits the text.
///   - leadingAccessory: A view builder for content to be displayed before the text field.
///   - trailingAccessory: A view builder for content to be displayed after the text field.
///   - footer: A view builder for content to be displayed below the text field.
public struct ChatField<LeadingAccessory: View, TrailingAccessory: View, FooterView: View>: View {
    private var titleKey: LocalizedStringKey
    @Binding private var text: String
    
    private var action: () -> Void
    private var leadingAccessory: () -> LeadingAccessory
    private var trailingAccessory: () -> TrailingAccessory
    private var footer: () -> FooterView
    
    /// Creates a new ChatField instance.
    ///
    /// - Parameters:
    ///   - titleKey: A localized string key for the placeholder text.
    ///   - text: A binding to the text entered by the user.
    ///   - action: A closure to be executed when the user submits the text.
    ///   - leadingAccessory: A view builder for content to be displayed before the text field.
    ///   - trailingAccessory: A view builder for content to be displayed after the text field.
    ///   - footer: A view builder for content to be displayed below the text field.
    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        action: @escaping () -> Void,
        @ViewBuilder leadingAccessory: @escaping () -> LeadingAccessory = { EmptyView() },
        @ViewBuilder trailingAccessory: @escaping () -> TrailingAccessory = { EmptyView() },
        @ViewBuilder footer: @escaping () -> FooterView = { EmptyView() }
    ) {
        self.titleKey = titleKey
        self._text = text
        self.action = action
        self.leadingAccessory = leadingAccessory
        self.trailingAccessory = trailingAccessory
        self.footer = footer
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center, spacing: 12) {
                leadingAccessory()
                BaseTextField(titleKey, text: $text, action: action)
                trailingAccessory()
            }
            
            footer()
        }
    }
}

#Preview {
    VStack {
        ChatField("Message", text: .constant("")) {
            print("Send message")
        } leadingAccessory: {
            Button(action: {}) {
                Image(systemName: "paperclip")
            }
        } trailingAccessory: {
            Button(action: {}) {
                Image(systemName: "arrow.up.circle.fill")
            }
        } footer: {
            Text("Lorem ipsum dolor sit amet.")
        }
        .chatFieldStyle(.capsule)
    }
    .padding()
}
