//
//  FeedStoryView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 28.11.2024.
//

import SwiftUI

struct FeedStoryView: View {
    @State var stories: [StoryModel] = []
    let user: User
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                let currentUserStory = stories.filter({ $0.user?.username == user.username})
                FeedStoryCell(story: .init(user: currentUserStory.first?.user ?? user,
                                           isSeen: currentUserStory.first?.isSeen ?? true,
                                           storyType: .curentUserStory,
                                           stories: currentUserStory.first?.stories ?? []))
                
                ForEach(stories.filter({ $0.user?.username != user.username })) { story in
                    FeedStoryCell(story: story)
                        .padding(.horizontal, 6)
                }
            }
            .padding(.horizontal, 8)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    FeedStoryView(stories: StoryModel.MOCK_STORIES, user: User.MOCK_USERS[0])
}
