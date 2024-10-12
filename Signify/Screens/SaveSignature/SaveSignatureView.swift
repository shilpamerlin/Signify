//
//  SignatureView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-19.
//

import SwiftUI

import SwiftUI

struct SaveSignatureView: View {
    
    @ObservedObject var viewModel: SaveSignatureViewModel
    @ObservedObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let template = viewModel.selectedTemplate {
                switch template.name {
                case "Classic":
                    ClassicTemplateView(userDetails: viewModel.userDetails)
                case "Horizontal":
                    HorizontalTemplateView(userDetails: viewModel.userDetails)
                case "Stacked":
                    StackedTemplateView(userDetails: viewModel.userDetails)
                case "Standard":
                    StandardTemplateView(userDetails: viewModel.userDetails)
                case "Leftbar":
                    LeftbarTemplateView(userDetails: viewModel.userDetails)
                case "Footer":
                    FooterTemplateView(userDetails: viewModel.userDetails)
                case "Corporate":
                    CorporateTemplateView(userDetails: viewModel.userDetails)
                case "Central":
                    CentralTemplateView(userDetails: viewModel.userDetails)
                case "Topbar":
                    TopbarTemplateView(userDetails: viewModel.userDetails)
                case "Rightbar":
                    RightbarTemplateView(userDetails: viewModel.userDetails)
                default:
                    Text("Unknown template")
                        .foregroundColor(.red)
                }
            } else {
                Text("No template selected")
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: 10) {
                Button(action: {
                    viewModel.navigateToDashboard = true
                    viewModel.saveSignature(dashboardViewModel: dashboardViewModel)
//                    Task {
//                        do {
//                            
//                            try await StorageViewModel.shared.saveSignature(userDetails: viewModel.userDetails, selectedTemplate: viewModel.selectedTemplate!, signatureID: viewModel.signatureID)
//                        } catch {
//                            viewModel.alertItem = AlertContext.failedToSaveSign
//                            print("Failed to save signature: \(error.localizedDescription)")
//                        }
//                    }
                }) {
                    Text("SAVE")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .padding()
                        .background(Color("appFontColor"))
                        .cornerRadius(8)
                }
                Button(action: {
                    viewModel.navigateToTemplateSelection = true
                }) {
                    Text("CHANGE TEMPLATE")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                        .frame(width: 180, height: 50)
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
            viewModel.navigateToEditForm = true
        }) {
            Text("Edit")
                .foregroundColor(Color("appFontColor"))
                .bold()
        })
        
        .navigationDestination(isPresented: $viewModel.navigateToEditForm) {
            UserInputFormView(userDetails: viewModel.userDetails, selectedTemplate: viewModel.selectedTemplate)
            EmptyView()
        }
        .navigationDestination(isPresented: $viewModel.navigateToTemplateSelection) {
            TemplateSelectionView(userDetails: viewModel.userDetails)
            EmptyView()
        }
        .navigationDestination(isPresented: $viewModel.navigateToDashboard) {
            DashboardView(refreshData: $viewModel.refreshData)
            EmptyView()
        }
        
        .alert(viewModel.alertItem?.title ?? Text("Something went wrong.."), isPresented: $viewModel.isShowingAlert) {
            
        } message: {
            viewModel.alertItem?.message
        }
        
        
    }
}
