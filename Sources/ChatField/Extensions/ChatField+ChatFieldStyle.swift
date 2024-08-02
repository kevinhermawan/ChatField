//
//  ChatField+ChatFieldStyle.swift
//
//
//  Created by Kevin Hermawan on 21/01/24.
//

import SwiftUI

public enum ChatFieldStyle {
    case capsule
}

extension ChatField {
    public func chatFieldStyle(_ style: ChatFieldStyle) -> some View {
        self.modifier(ChatFieldStyleModifier(style: style))
    }
}
