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
            .padding(.vertical, 8)
            .padding(.horizontal)
            .textFieldStyle(.plain)
            .overlay(
                Capsule()
                    .stroke(.secondary, lineWidth: 0.5)
            )
    }
    
    @ViewBuilder
    private func ClipShape() -> some Shape {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
    }
}
