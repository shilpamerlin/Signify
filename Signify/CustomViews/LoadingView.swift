//
//  LoadingView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-26.
//

import SwiftUI

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Color("appFontColor"))
                .scaleEffect(2)
                .padding(.top, 10)
        }
        .padding(20)
        .background(Color(.systemBackground))
        
    }
}

#Preview {
    LoadingView()
}
