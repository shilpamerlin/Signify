//
//  UserDetails.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-18.
//

import UIKit

import Foundation
import UIKit
import SwiftUI

struct UserDetails: Equatable {
    
    var fullName: String
    var jobTitle: String
    var emailAddress: String
    var phoneNumber: String
    var profilePicture: UIImage?
    var companyWebsite: String
    var companyLogo: UIImage?
    var companyAddress: String
}

extension UserDetails {
    static var SAMPLE_USER = UserDetails(fullName: "John Doe", jobTitle: "Senior HR Recruiter", emailAddress: "john.doe@signify.com", phoneNumber: "643-894-2134", profilePicture: UIImage(named: "person"), companyWebsite: "www.signify.com", companyLogo: UIImage(named: "logo"), companyAddress: "123 ABC Street, QueensTown, PL")
}
