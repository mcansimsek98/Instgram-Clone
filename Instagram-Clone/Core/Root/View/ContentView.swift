//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject private var registrationViewModel = RegistrationViewModel()
    @State private var isSplashVisible = true
    
    var body: some View {
        Group {
            if isSplashVisible {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isSplashVisible = false
                        }
                    }
            } else if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

