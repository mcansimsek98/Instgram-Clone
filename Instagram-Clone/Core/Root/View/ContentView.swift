//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            }else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }else {
                SplashView()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
