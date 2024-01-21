//
//  CapsuleChatFieldStyle.swift
//
//
//  Created by Kevin Hermawan on 11/12/23.
//

import SwiftUI

struct CapsuleChatFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .textFieldStyle(.plain)
            .clipShape(ClipShape())
            #if os(iOS)
            .overlay(ClipShape().stroke(Color(.separator)))
            #elseif os(macOS)
            .overlay(ClipShape().stroke(Color(.separatorColor)))
            #endif
    }
    
    @ViewBuilder
    private func ClipShape() -> some Shape {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
    }
}
