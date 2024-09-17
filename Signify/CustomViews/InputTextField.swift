//
//  InputView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-12.
//

import SwiftUI

struct InputTextField: View {
    
    @Binding var text: String
    let title: String
    var body: some View {
   
            
            TextField(title, text: $text)
                .foregroundColor(.white)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
        
    }
}

#Preview {
    InputTextField(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
