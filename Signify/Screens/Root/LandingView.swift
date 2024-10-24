//
//  LandingView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-18.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                RootView()
            } else {
                VStack(){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    HStack {
                    Text("Signify")
                        .font(.custom("Papyrus", size: 50))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Text("pro")
                        .font(.custom("Papyrus", size: 25))
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                        .baselineOffset(-30)
                }
                    Text("Every signature holds significance")
                    
                        .font(.custom("Noteworthy", size: 15))
                        .fontWeight(.medium)
                        .italic()
                        .foregroundStyle(Color("appFontColor"))
                        .padding(.leading, 150)
                }
                
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brandPrimary)
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    LandingView()
}
