//
//  TabView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-17.
//

import SwiftUI

struct SignifyTabView: View {
    @State private var refreshData = false
    @State private var selectedTab: Int = 0
    @State private var homeNavigationPath = NavigationPath()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $homeNavigationPath) {
                           TemplateSelectionView(userDetails: UserDetails.SAMPLE_USER)
                               .navigationDestination(for: String.self) { destination in
                                   if destination == "TemplateSelectionView" {
                                       TemplateSelectionView(userDetails: UserDetails.SAMPLE_USER)
                                   }
                               }
                       }
                       .tabItem { Label("Home", systemImage: "house") }
                       .tag(0)
            
            DashboardView(refreshData: $refreshData)
                .tabItem { Label("Dashboard", systemImage: "list.bullet") }
                .tag(1)
            
            ProfileView()
                .tabItem { Label("My Account", systemImage: "person") }
                .tag(2)
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == 0 {
                            
                            homeNavigationPath.removeLast(homeNavigationPath.count)
                            homeNavigationPath.append("TemplateSelectionView") 
                        }
        }
        .tint(Color("appFontColor"))
    }
}
#Preview {
    SignifyTabView()
}
