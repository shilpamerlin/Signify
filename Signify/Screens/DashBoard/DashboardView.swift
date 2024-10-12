//
//  DashboardView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-17.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var dashViewModel = DashboardViewModel()
    @Binding var refreshData: Bool
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    
                    List {
                        
                        ForEach(dashViewModel.savedSignatures) { sign in
                            signatureRow(for: sign)
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    .listStyle(.plain)
                    
                    if dashViewModel.savedSignatures.isEmpty {
                    
                        EmptySignatureView(imageName: "empty-image", message: "No saved signatures yet. Create one to personalize your emails")
                       
                    }
                }
                if dashViewModel.isLoading {
                    LoadingView()
                }
            }
                .navigationTitle("Saved Signatures")
                .navigationBarBackButtonHidden()
            
                .onAppear {
                    Task {
                        try? await dashViewModel.fetchSignatures()
                     
                    }
                    
                }
                .onChange(of: refreshData) {
                    if refreshData {
                        Task {
                            try? await dashViewModel.fetchSignatures()
                            refreshData = false  // Reset refreshData after fetching
                        }
                    }
                }
              
                .navigationDestination(isPresented: $dashViewModel.isEditingInfo) {
                    if let selectedSign = dashViewModel.selectedSign {
                        UserInputFormView(userDetails: selectedSign.userDetails , selectedTemplate: selectedSign.template, signatureID: selectedSign.id)
                                      } else {
                                          EmptyView()
                                      }
                }
               
            
         
           
            
        }
    
        .alert(dashViewModel.alertItem?.title ?? Text("Something went wrong.."), isPresented: $dashViewModel.isShowingAlert) {
            
        } message: {
            dashViewModel.alertItem?.message
        }
    }
    @ViewBuilder
    private func signatureRow(for sign: Signature) -> some View {
        HStack() {
            switch sign.template.name {
            case "Classic":
                ClassicTemplateView(userDetails: sign.userDetails)
            case "Horizontal":
                HorizontalTemplateView(userDetails: sign.userDetails)
            case "Stacked":
                StackedTemplateView(userDetails: sign.userDetails)
            case "Standard":
                StandardTemplateView(userDetails: sign.userDetails)
            case "Leftbar":
                LeftbarTemplateView(userDetails: sign.userDetails)
            case "Footer":
                FooterTemplateView(userDetails: sign.userDetails)
            case "Corporate":
                CorporateTemplateView(userDetails: sign.userDetails)
            case "Central":
                CentralTemplateView(userDetails: sign.userDetails)
            case "Topbar":
                TopbarTemplateView(userDetails: sign.userDetails)
            case "Rightbar":
                RightbarTemplateView(userDetails: sign.userDetails)
            default:
                Text("Unknown template")
                    .foregroundColor(.red)
            }
            Spacer()
            Button(action: {
                dashViewModel.selectedSign = sign
                
                dashViewModel.isEditingInfo = true
            }) {
                
                DownloadButtonView(iconName: "pencil")
                    .contentShape(Rectangle())
                
            }
            .buttonStyle(PlainButtonStyle())
            Button(action: {
                dashViewModel.isShowingAlert = true
                downloadSignatureToAlbum(signature: sign)
                dashViewModel.alertItem = AlertContext.downloadSignature
            }) {
           DownloadButtonView(iconName: "arrow.down.to.line")
                    .contentShape(Rectangle())
                    
        }
            .buttonStyle(PlainButtonStyle())
        }
        .background(Color("brandPrimary"))
       // Make the row tappable in terms of hit testing
    }
    private func downloadSignatureToAlbum(signature: Signature) {
        let renderer = ImageRenderer(content: SignatureTemplateView(sign: signature).frame(width: 320, height: 320))
        
        if let image = renderer.uiImage {
            saveImageToAlbum(image: image)
        }
    }
    
    private func saveImageToAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    struct SignatureTemplateView: View {
        var sign: Signature
        
        var body: some View {
            switch sign.template.name {
            case "Classic":
                ClassicTemplateView(userDetails: sign.userDetails)
            case "Horizontal":
                HorizontalTemplateView(userDetails: sign.userDetails)
            case "Stacked":
                StackedTemplateView(userDetails: sign.userDetails)
            case "Standard":
                StandardTemplateView(userDetails: sign.userDetails)
            case "Leftbar":
                LeftbarTemplateView(userDetails: sign.userDetails)
                        case "Footer":
                            FooterTemplateView(userDetails: sign.userDetails)
                        case "Corporate":
                            CorporateTemplateView(userDetails: sign.userDetails)
                        case "Central":
                            CentralTemplateView(userDetails: sign.userDetails)
                        case "Topbar":
                            TopbarTemplateView(userDetails: sign.userDetails)
                        case "Rightbar":
                            RightbarTemplateView(userDetails: sign.userDetails)
            default:
                Text("Unknown template")
                    .foregroundColor(.red)
            }
        }
    }
}

