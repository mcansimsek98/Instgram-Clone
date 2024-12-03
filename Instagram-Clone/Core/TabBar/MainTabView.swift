//
//  MainTabView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .onAppear {
                    selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear {
                    selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            GalleryImagePicker(tabIndex: $selectedTab)
                .onAppear {
                    selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notification")
                .onAppear {
                    selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            ProfileView(user: user, isCurrentUser: true)
                .onAppear {
                    selectedTab = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.igBlack)
    }
}

//#Preview {
//    MainTabView(user: User.MOCK_USERS[0])
//}
