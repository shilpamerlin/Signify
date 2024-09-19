//
//  SignatureView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-19.
//

import SwiftUI

struct SaveSignatureView: View {
    var selectedTemplate: Template?
    var userDetails: UserDetails
    
    @State private var navigateToEditForm = false
    @State private var navigateToDashboard = false
    
    var body: some View {
       
        VStack {
             if let template = selectedTemplate {
                 if template.name == "Template 1" {
                     SignatureTemplate1(userDetails: userDetails)
                 } else if template.name == "Template 2" {
                     SignatureTemplate2(userDetails: userDetails)
                 } else if template.name == "Template 3" {
                     SignatureTemplate3(userDetails: userDetails)
                 } else {
                     Text("Unknown template")
                         .foregroundColor(.red)
                 }
             } else {
                 Text("No Template Selected")
                     .foregroundColor(.gray)
                     .font(.headline)
             }
            Spacer()
            HStack(spacing: 10) {
                Button(action: {
                    navigateToDashboard = true
                    NavigationLink(destination: UserInputFormView(selectedTemplate: selectedTemplate), isActive: $navigateToDashboard) {
                        EmptyView()
                    }
                }) {
                        Text("SAVE")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("appFontColor"))
                            .cornerRadius(8)
                }
                Button(action: {
                    navigateToEditForm = true
                    NavigationLink(destination: UserInputFormView(selectedTemplate: selectedTemplate), isActive: $navigateToEditForm) {
                        EmptyView()
                    }
                }) {
                   
                        Text("EDIT")
                            .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("appFontColor"))
                    .cornerRadius(8)
                }

            }
            Spacer()
         }
         .navigationTitle("Your Signature")
         .padding()
         .navigationBarItems(trailing: Button(action: {
             // Navigate to the form or edit details
             navigateToEditForm = true
         }) {
             Text("Edit")
                 .foregroundColor(Color("appFontColor"))
                 .bold()
         })
         .background(
             NavigationLink(destination: UserInputFormView(selectedTemplate: selectedTemplate), isActive: $navigateToEditForm) {
                 EmptyView()
             }
             .hidden()
         )
     }
 }
