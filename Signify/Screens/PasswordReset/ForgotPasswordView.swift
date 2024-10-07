//
//  ForgotPasswordView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-10-04.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var message: String = ""
    @State private var isError: Bool = false
    @State private var isEmailSent: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(Color("appFontColor"))
                    InputTextField(text: $email, title: "Email")
                        .autocapitalization(.none)
                        
                    Spacer()
                        
                    
                }
                .padding()
                .background(Color("brandPrimary").opacity(0.8))
                .cornerRadius(8)
                
                Button(action: {
                    sendPasswordReset()
                }) {
                    Text("Send Password Request")
                        .fontWeight(.semibold)
                    
                        .foregroundColor(.white)
                    
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color("appFontColor"))
                        .cornerRadius(8)
                    if isEmailSent {
                        Text("Password reset email sent successfully.")
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    if isError {
                        Text(message)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
               
            }
            .padding()
        }
    }
    
    func sendPasswordReset() {
        
        guard !email.isEmpty else {
            self.message = "Please enter your email."
            self.isError = true
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.message = error.localizedDescription
                self.isError = true
            } else {
                self.isEmailSent = true
                self.isError = false
                self.message = ""
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
