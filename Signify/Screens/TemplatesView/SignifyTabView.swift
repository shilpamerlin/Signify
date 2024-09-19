//
//  TabView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-17.
//

import SwiftUI

struct SignifyTabView: View {
    var body: some View {
        TabView {
            
                TemplateListView()
                    .tabItem { Label("Home", systemImage: "house") }
                SavedSignaturesView()
                .tabItem { Label("Saved Signatures", systemImage: "list.bullet") }
            ProfileView()
                .tabItem { Label("My Account", systemImage: "person") }
            
        }
        .tint(.green)
    }
}

#Preview {
    SignifyTabView()
}
