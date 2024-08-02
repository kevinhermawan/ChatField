//
//  BaseTextField.swift
//  ChatField
//
//  Created by Kevin Hermawan on 8/3/24.
//

#if canImport(UIKit)
import SwiftUI

struct BaseTextField: View {
    private var titleKey: LocalizedStringKey
    
    @Binding private var text: String
    private var action: () -> Void
    
    init (_ titleKey: LocalizedStringKey, text: Binding<String>, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self._text = text
        self.action = action
    }
    
    var body: some View {
        TextField(titleKey, text: $text, axis: .vertical)
            .lineLimit(5)
            .onSubmit(action)
    }
}
#endif

#if canImport(AppKit)
import SwiftUI
import SwiftUIIntrospect

struct BaseTextField: View {
    private var titleKey: LocalizedStringKey
    
    @Binding private var text: String
    private var action: () -> Void
    
    init (_ titleKey: LocalizedStringKey, text: Binding<String>, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self._text = text
        self.action = action
    }
    
    var body: some View {
        TextField(titleKey, text: $text, axis: .vertical)
            .introspect(.textField(axis: .vertical), on: .macOS(.v14)) { textField in
                textField.lineBreakMode = .byWordWrapping
            }
            .onSubmit(macOS_action)
    }
    
    private func macOS_action() {
        if NSApp.currentEvent?.modifierFlags.contains(.shift) == true {
            text.appendNewLine()
        } else {
            action()
        }
    }
}
#endif
