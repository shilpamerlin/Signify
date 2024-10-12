//
//  UserInputFormView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-18.
//

import SwiftUI

struct UserInputFormView: View {
    
    @State var userDetails = UserDetails(fullName: "", jobTitle: "", emailAddress: "", phoneNumber: "", profilePicture: nil, companyWebsite: "", companyLogo: nil, companyAddress: "")
    @State private var showImagePicker = false
    @State private var showLogoPicker = false
    let selectedTemplate: Template?
    @State private var navigateToSignaturePage = false
    @State var signatureID: String?
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Information")) {
                        TextField("Full Name", text: $userDetails.fullName)
                        TextField("Email Address", text: $userDetails.emailAddress)
                            .textInputAutocapitalization(.never)
                        TextField("Phone Number", text: $userDetails.phoneNumber)
                        TextField("Job Title", text: $userDetails.jobTitle)
                        Button(action: {
                            showImagePicker.toggle()
                        }) {
                            HStack {
                                Text("Select Profile Picture")
                                Spacer()
                                if userDetails.profilePicture != nil {
                                    Image(uiImage: userDetails.profilePicture!)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        
                    }
                    Section(header: Text("Company Details")) {
                        TextField("Company Website", text: $userDetails.companyWebsite)
                            .textInputAutocapitalization(.never)
                        TextField("Company Address", text: $userDetails.companyAddress)
                        Button(action: {
                            showLogoPicker.toggle()
                        }) {
                            HStack {
                                Text("Select Company Logo")
                                Spacer()
                                if userDetails.companyLogo != nil {
                                    Image(uiImage: userDetails.companyLogo!)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
                .autocorrectionDisabled()
                
                Button(action: {
                    if isFormValid {
                        navigateToSignaturePage = true
                    }
                    
                }) {
                    Text("Generate Signature")
                        .padding()
                    
                        .frame(maxWidth: .infinity)
                        .background(Color("appFontColor"))
                        .foregroundStyle(.white)
                        .bold()
                        .disabled(!isFormValid)
                        .opacity(isFormValid ? 1.0 : 0.5)
                        .cornerRadius(10)
                }
                .padding()
            }
            .sheet(isPresented: $showImagePicker) {
                
                ImagePicker(selectedImage: $userDetails.profilePicture)
            }
            .sheet(isPresented: $showLogoPicker) {
                ImagePicker(selectedImage: $userDetails.companyLogo)
            }
            .navigationDestination(isPresented: $navigateToSignaturePage) {
                
                SaveSignatureView(viewModel: SaveSignatureViewModel(signatureID: signatureID, selectedTemplate: selectedTemplate!, userDetails: userDetails), dashboardViewModel: DashboardViewModel())
            }
        }
        .navigationTitle("User Information")
        .navigationBarTitleDisplayMode(.large) 
    }
}
extension UserInputFormView: AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !userDetails.fullName.isEmpty
        && !userDetails.emailAddress.isEmpty
        && isValidEmail(userDetails.emailAddress)
        && !userDetails.phoneNumber.isEmpty
        && isValidPhoneNumber(userDetails.phoneNumber)
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegex = "([+]?1+[-]?)?+([(]?+([0-9]{3})?+[)]?)?+[-]?+[0-9]{3}+[-]?+[0-9]{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
}
