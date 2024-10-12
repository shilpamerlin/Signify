//
//  User.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-16.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String

    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let component = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: component)
        }
         return ""
        
    }
    
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, fullname: "Shilpa Joy", email: "test@gmail.com")
}
