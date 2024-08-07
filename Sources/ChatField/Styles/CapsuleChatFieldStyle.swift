//
//  CapsuleChatFieldStyle.swift
//
//
//  Created by Kevin Hermawan on 11/12/23.
//

import SwiftUI

struct CapsuleChatFieldStyle: TextFieldStyle {
    @State private var textHeight: CGFloat = 0
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 8)
            .padding(.horizontal)
            .textFieldStyle(.plain)
            .background(
                GeometryReader { geometry in
                    Color.clear.preference(key: ViewHeightKey.self, value: geometry.size.height)
                }
            )
            .onPreferenceChange(ViewHeightKey.self) { height in
                self.textHeight = height
            }
            .overlay(
                Group {
                    if textHeight <= 40 {
                        Capsule()
                            .stroke(.secondary, lineWidth: 0.5)
                    } else {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(.secondary, lineWidth: 0.5)
                    }
                }
            )
    }
}
