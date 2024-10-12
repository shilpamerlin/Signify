//
//  ForgotPasswordViewModel.swift
//  Signify
//
//  Created by Shilpa Joy on 2024-10-04.
//

import SwiftUI

@MainActor
class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    @Published var navigationPath = NavigationPath()
}
