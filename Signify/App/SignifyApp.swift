//
//  SignifyApp.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-11.
//

import SwiftUI
import Firebase

@main
struct SignifyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
