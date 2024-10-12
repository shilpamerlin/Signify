//
//  StorageViewModel.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-19.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

@MainActor
struct StorageViewModel {
    
    static let shared = StorageViewModel()
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    func saveSignature(userDetails: UserDetails, selectedTemplate: Template, signatureID: String? = nil) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "FirebaseAuth", code: 401, userInfo: [NSLocalizedDescriptionKey: "User is not authenticated"])
        }
        
        var profilePicURL: String = ""
        var companyLogoURL: String = ""
        
        if let profileImage = userDetails.profilePicture {
            profilePicURL = try await uploadImage(selectedImage: profileImage)
        }
        if let companyLogoImage = userDetails.companyLogo {
            companyLogoURL = try await uploadImage(selectedImage: companyLogoImage)
        }
        let documentID = signatureID ?? UUID().uuidString
        
        let signatureData: [String: Any] = [
            "userID": uid,
            "fullName": userDetails.fullName,
            "email": userDetails.emailAddress,
            "phoneNumber": userDetails.phoneNumber,
            "jobTitle": userDetails.jobTitle,
            "companyAddress": userDetails.companyAddress,
            "website": userDetails.companyWebsite,
            "templateName": selectedTemplate.name,
            "profilePicURL": profilePicURL,
            "companyLogoURL": companyLogoURL
        ]
        try await db.collection("signatures").document(documentID).setData(signatureData)
        
        print("Signature saved successfully!")
    }
    
    func uploadImage(selectedImage: UIImage)  async throws -> String {
        guard selectedImage != nil else {
            throw NSError(domain: "ImgedoesnotExist", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed to get image"])
        }
        let storageRef = Storage.storage().reference()
        let imageData = selectedImage.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            throw NSError(domain: "ImageConversion", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to JPEG format"])
        }
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        _ = try await fileRef.putDataAsync(imageData!)
        
        let downloadURL = try await fileRef.downloadURL()
        
        return downloadURL.absoluteString
    }
}
extension StorageReference {
    func putDataAsync(_ uploadData: Data) async throws -> StorageMetadata {
        try await withCheckedThrowingContinuation { continuation in
            self.putData(uploadData, metadata: nil) { metadata, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let metadata = metadata {
                    continuation.resume(returning: metadata)
                }
            }
        }
    }
}
