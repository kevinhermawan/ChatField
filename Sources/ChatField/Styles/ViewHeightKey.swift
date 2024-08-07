//
//  ViewHeightKey.swift
//  ChatField
//
//  Created by Kevin Hermawan on 8/8/24.
//

import Foundation
import SwiftUI

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
