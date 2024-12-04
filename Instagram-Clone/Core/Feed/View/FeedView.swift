//
//  FeedView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct FeedView: View {
    let user: User
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 18) {
                    FeedStoryView(stories: viewModel.stories, user: user)
                    
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 10)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(.logo2)
                        .resizable()
                        .frame(width: 100, height: 48)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
        .onAppear() {
            Task {
                try await viewModel.fetchPosts()
            }
        }
    }
}

//#Preview {
//    FeedView()
//}
