//
//  SavedSignature.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-19.
//

import Foundation

struct Signature: Identifiable {
    let id = UUID()
    let template: Template
    let userDetails: UserDetails
}
