//
//  SignatureCollection.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-23.
//

import SwiftUI

@MainActor
class SaveSignatureViewModel: ObservableObject {
    
    @Published var selectedTemplate: Template?
    @Published var userDetails: UserDetails
    @Published var alertItem: AlertItem?
    @Published var refreshData: Bool = false
    @Published var navigateToEditForm = false
    @Published var navigateToTemplateSelection = false
    @Published var navigateToDashboard = false
    @Published var isShowingAlert = false
    @Published var signatureID: String?
    
    init(signatureID: String? = nil, selectedTemplate: Template, userDetails: UserDetails) {
        self.selectedTemplate = selectedTemplate
        self.userDetails = userDetails
        self.signatureID = signatureID
    }
    
    func saveSignature(dashboardViewModel: DashboardViewModel) {
            Task {
                do {
                    try await StorageViewModel.shared.saveSignature(
                        userDetails: userDetails,
                        selectedTemplate: selectedTemplate!,
                        signatureID: signatureID
                    )
                    
                    // Optimistic update to dashboard's signature list
                    let newSignature = Signature(
                        id: signatureID ?? UUID().uuidString,
                        template: selectedTemplate!,
                        userDetails: userDetails
                    )
                    dashboardViewModel.addNewSignature(signature: newSignature)
                    
                    // Mark data as refreshed
                    self.refreshData = true
                    
                } catch {
                    self.alertItem = AlertContext.failedToSaveSign
                    print("Failed to save signature: \(error.localizedDescription)")
                }
            }
        }
}
