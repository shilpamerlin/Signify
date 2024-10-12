//
//  ForgotPasswordView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-10-04.
//

import SwiftUI
import FirebaseAuth
import Foundation

struct ForgotPasswordView: View {
    
    @StateObject private var viewModel = ForgotPasswordViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(Color("appFontColor"))
                    InputTextField(text: $viewModel.email, title: "Email")
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
                }
                
            }
            .padding()
            .alert(viewModel.alertItem?.title ?? Text("Something went wrong.."), isPresented: $viewModel.isShowingAlert) {
                
            } message: {
                viewModel.alertItem?.message
            }
        }
        
        
       
        
       
    }
    
    func sendPasswordReset() {
        
        if viewModel.email.isEmpty {
            viewModel.isShowingAlert = true
            viewModel.alertItem = AlertContext.emailNotEntered
        }
        
        Auth.auth().sendPasswordReset(withEmail: viewModel.email) { error in
            if let error = error {
                viewModel.isShowingAlert = true
                viewModel.alertItem = AlertContext.failedToResetPassword
            } else {
                viewModel.isShowingAlert = true
                viewModel.alertItem = AlertContext.resetPasswordSucess
                viewModel.email = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                      dismiss()
                }
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
