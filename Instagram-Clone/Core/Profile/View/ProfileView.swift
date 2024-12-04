//
//  ProfileView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var posts: [PostModel] {
        return PostModel.MOCK_POTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        if user.isCurrentUser {
            NavigationStack {
                ProfileContentView(user: user)
            }
        }else {
            ProfileContentView(user: user)
        }
    }
}

//#Preview {
//    ProfileView(user: User.MOCK_USERS[0])
//}
