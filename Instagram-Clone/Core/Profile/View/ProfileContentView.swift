//
//  ProfileContentView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct ProfileContentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ProfileViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            /// Header
            ProfileHeaderView(user: viewModel.user)
            
            /// PostGridView
            PostGridView(posts: viewModel.posts)
        }
        .navigationTitle(viewModel.user.isCurrentUser ? "Profile" : viewModel.user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if viewModel.user.isCurrentUser {
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
        .onAppear {
            Task {
                try await viewModel.fetchUsersPosts()
            }
        }
    }
}
