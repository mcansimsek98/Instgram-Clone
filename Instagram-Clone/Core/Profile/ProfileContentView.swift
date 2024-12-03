//
//  ProfileContentView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct ProfileContentView: View {
    let user: User
    let isCurrentUser: Bool
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
        .navigationTitle(isCurrentUser ? "Profile" : user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isCurrentUser {
                ToolbarItem {
                    Button {} label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                }
            }else {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

//#Preview {
//    ProfileContentView(user: User.MOCK_USERS[0], isCurrentUser: true)
//}
