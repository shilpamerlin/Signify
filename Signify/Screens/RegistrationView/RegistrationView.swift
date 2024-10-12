//
//  SignUpView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-11.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandPrimary
                VStack(spacing: 20) {
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFill()
                        .padding(.top, 15)
                    
                    VStack(spacing: 30) {
                        InputTextField(text: $email, title: "Email Address")
                            .padding(.vertical, 8)
                            .overlay(
                                Line(),
                                alignment: .bottom
                            )
                        
                        InputTextField(text: $fullname, title: "Full Name")
                            .padding(.vertical, 8)
                            .overlay(
                                Line(),
                                alignment: .bottom
                            )
                        SecureField("Password", text: $password)
                            .padding(.vertical, 8)
                            .overlay(
                                Line(),
                                alignment: .bottom
                            )
                        ZStack(alignment: .trailing) {
                            SecureField("Confirm Password", text: $confirmPassword)
                                .padding(.vertical, 8)
                                .overlay(
                                    Line(),
                                    alignment: .bottom
                                )
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.small)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.green)
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.small)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.red)
                                }
                            }
                        }
                        Button(action: {
                            Task {
                                try await viewModel.createUser(withEmail: email, withPassword:password, fullname: fullname)
                            }
                        }) {
                            HStack {
                                Text("SIGN UP")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            
                            .foregroundColor(.white)
                            
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("appFontColor"))
                            .disabled(!isFormValid)
                            .opacity(isFormValid ? 1.0 : 0.7)
                            .cornerRadius(8)
                        }
                        .padding(.top, 20)
                    }
                    .padding(25)
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("Have an account?")
                            Text("Sign In")
                                .fontWeight(.bold)
                            
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color("appFontColor"))
                    }
                    
                }
            }
            .ignoresSafeArea()
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 6
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
