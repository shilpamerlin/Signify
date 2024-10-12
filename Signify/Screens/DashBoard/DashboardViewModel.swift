//
//  DashBoardViewModel.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-20.
//

import FirebaseFirestore
import FirebaseAuth
import SwiftUI

@MainActor
class DashboardViewModel: ObservableObject {
    @Published var savedSignatures: [Signature] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    @Published var isEditingInfo = false
    @Published var selectedSign: Signature?
    
    private let db = Firestore.firestore()
    
    func fetchSignatures() async throws  {
        isLoading = true
        
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "FirebaseAuth", code: 401, userInfo: [NSLocalizedDescriptionKey: "User is not authenticated"])
        }
        
        let snapshot = try await db.collection("signatures")
            .whereField("userID", isEqualTo: uid)
            .getDocuments()
        
        var signatures: [Signature] = []
        
        for document in snapshot.documents {
            let data = document.data()
            let signatureID = document.documentID
            guard let fullName = data["fullName"] as? String,
                  let jobTitle = data["jobTitle"] as? String,
                  let emailAddress = data["email"] as? String,
                  let phoneNumber = data["phoneNumber"] as? String,
                  let templateName = data["templateName"] as? String,
                  let companyAddress = data["companyAddress"] as? String,
                  let companyWebsite = data["website"] as? String else {
                continue
            }
            
            let profilePicURL = data["profilePicURL"] as? String
            let companyLogoURL = data["companyLogoURL"] as? String
            var companyLogoImage: UIImage?
            var profileImage: UIImage?
            
            if let logoURLString = companyLogoURL, let logoURL = URL(string: logoURLString) {
                companyLogoImage = try await downloadImage(from: logoURL)
            }
            if let profileURLString = profilePicURL, let profileURL = URL(string: profileURLString) {
                profileImage = try await downloadImage(from: profileURL)
            }
            
            let userDetails = UserDetails(
                fullName: fullName,
                jobTitle: jobTitle,
                emailAddress: emailAddress,
                phoneNumber: phoneNumber,
                profilePicture: profileImage,
                companyWebsite: companyWebsite,
                companyLogo: companyLogoImage,
                companyAddress: companyAddress
            )
            let template = Template(
                name: templateName
            )
            let signature = Signature(
                id: signatureID,
                template: template,
                userDetails: userDetails
            )
            signatures.append(signature)
        }
        isLoading = false
        savedSignatures = signatures
    }
    
    func downloadImage(from url: URL) async throws -> UIImage? {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "InvalidResponse", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid response from server"])
        }
        return UIImage(data: data)
    }
    
    func addNewSignature(signature: Signature) {
        isLoading = true
        savedSignatures.append(signature)
    }
}

