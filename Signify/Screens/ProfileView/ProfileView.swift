//
//  ProfileView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-13.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        if let user = viewModel.currentUser {
            List {
                HStack {
                    Section {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Section("General") {
                    HStack {
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color.gray)
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                    }
                    
                }
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    Button {
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
