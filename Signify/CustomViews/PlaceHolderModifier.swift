//
//  PlaceHolderModifier.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-12.
//

import SwiftUI

struct PlaceholderTextFieldStyle: ViewModifier {
    var placeholder: String
    var placeholderColor: Color
    @Binding var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(placeholderColor)
                    .padding(.leading, 2)
            }
            content
                .foregroundColor(.white)
                .padding(.vertical, 8)
        }
    }
}

extension View {
    func placeholderStyle(placeholder: String, placeholderColor: Color, text: Binding<String>) -> some View {
        self.modifier(PlaceholderTextFieldStyle(placeholder: placeholder, placeholderColor: placeholderColor, text: text))
    }
}

