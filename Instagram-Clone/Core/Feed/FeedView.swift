//
//  FeedView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 18) {
                    FeedStoryView(stories: StoryModel.MOCK_STORIES,
                                  user: User.MOCK_USERS[0])
                    
                    ForEach(PostModel.MOCK_POTS) { post in
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
    }
}

//#Preview {
//    FeedView()
//}
