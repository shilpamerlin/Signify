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
    
    @StateObject var viewModel = AuthViewModel()
 
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(viewModel)
        }
    }
}
