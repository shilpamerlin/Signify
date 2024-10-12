//
//  EmptySignatureView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-10-03.
//

import SwiftUI

struct EmptySignatureView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .tint(.red)
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
                    
            }
            .offset(y: -150)
        }
    }
}

#Preview {
    EmptySignatureView(imageName: "empty-image", message: "This is our message")
}

