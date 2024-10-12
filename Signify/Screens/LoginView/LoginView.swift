//
//  ContentView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-11.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var showForgotPassword = false
    
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
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                        InputTextField(text: $email, title: "Email")
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(8)
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.white)
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(8)
                    
                    Button(action: {
                        showForgotPassword = true
                    }) {
                        Text("Forgot Password?")
                            .foregroundColor(Color("appFontColor"))
                            .font(.footnote)
                            .bold()
                            .sheet(isPresented: $showForgotPassword, content: {
                                ForgotPasswordView()
                            })
                    }
                    .padding(.leading, 200)
                    Button(action: {
                        Task {
                            try await viewModel.signIn(withEmail: email, withPassword: password)
                        }
                    }) {
                        HStack {
                            Text("SIGN IN")
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
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.bold)
                            
                        }
                        .font(.system(size: 14))
                        .foregroundStyle(Color("appFontColor"))
                    }
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}

extension LoginView: AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 6
    }
}
