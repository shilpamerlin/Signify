//
//  Alert.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    
}


struct AlertContext {
    
    static let downloadSignature      = AlertItem(title: Text("Signature Downloaded"),
                                              message: Text("Please Check Your Gallery"))
    static let saveSignature      = AlertItem(title: Text("Signature Saved"),
                                              message: Text("Please Check Dashboard For Downloading"))
    
    static let failedToSaveSign  = AlertItem(title: Text("Error Occurred"),
                                             message: Text("Unable to save signature. Please try again"))
    static let resetPasswordSucess = AlertItem(title: Text("Success"),
                                             message: Text("Password reset email has been sent to registered email. Please check your inbox."))
    
    static let failedToResetPassword  = AlertItem(title: Text("Error Occurred"),
                                             message: Text("Unable to send password reset email. Please try again"))
    static let emailNotEntered  = AlertItem(title: Text("Enter your email"),
                                             message: Text("Reset password link will be send to the email"))
    
}
