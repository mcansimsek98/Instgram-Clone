//
//  ProfileContentView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct ProfileContentView: View {
    let user: User
    @Environment(\.dismiss) var dismiss

    var posts: [PostModel] {
        return PostModel.MOCK_POTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            /// Header
            ProfileHeaderView(user: user)
            
            /// PostGridView
            PostGridView(posts: posts)
        }
        .navigationTitle(user.isCurrentUser ? "Profile" : user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if user.isCurrentUser {
                ToolbarItem {
                    Button {
                        AuthService.shared.singOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.igBlack)
                    }
                }
            }else {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .tint(.igBlack)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

//#Preview {
//    ProfileContentView(user: User.MOCK_USERS[0])
//}