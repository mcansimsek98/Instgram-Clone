//
//  ProfileView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
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
