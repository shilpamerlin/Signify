//
//  DownloadButtonView.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-09-26.
//

import SwiftUI

struct DownloadButtonView: View {
 
    var iconName: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("appFontColor"))
                .frame(width: 30, height: 30)
            
            Image(systemName: iconName)
                .padding()
                .foregroundColor(.white)
        }
    }
}

