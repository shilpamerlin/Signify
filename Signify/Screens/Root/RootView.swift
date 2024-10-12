//
//  RootView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-17.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                SignifyTabView()
            } else {
                LoginView()
            }
            
        }
    }
}

#Preview {
    RootView()
}
