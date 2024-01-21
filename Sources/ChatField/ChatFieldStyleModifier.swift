//
//  ChatFieldStyleModifier.swift
//
//
//  Created by Kevin Hermawan on 21/01/24.
//

import SwiftUI

struct ChatFieldStyleModifier: ViewModifier {
    var style: ChatFieldStyle
    
    func body(content: Content) -> some View {
        content
            .textFieldStyle(textFieldStyle())
    }
    
    private func textFieldStyle() -> some TextFieldStyle {
        switch style {
        case .capsule:
            CapsuleChatFieldStyle()
        }
    }
}
