//
//  FeedStoryView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 28.11.2024.
//

import SwiftUI

struct FeedStoryView: View {
    @State private var selectedStory: StoryModel?
    @State var stories: [StoryModel] = []
    let user: User
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                let currentUserStory = stories.filter { $0.user?.username == user.username }.first
                let userStory: StoryModel = .init(user: currentUserStory?.user ?? user,
                                                  storyType: .curentUserStory,
                                                  stories: currentUserStory?.stories ?? [])
                
                FeedStoryCell(story: userStory)
                    .onTapGesture {
                        if userStory.stories.count != 0 {
                            selectedStory = userStory
                        }
                    }
                
                ForEach(stories.filter { $0.user?.username != user.username }) { story in
                    FeedStoryCell(story: story)
                        .padding(.horizontal, 6)
                        .onTapGesture {
                            if story.stories.count != 0 {
                                selectedStory = story
                            }
                        }
                }
            }
            .padding(.horizontal, 8)
        }
        .scrollIndicators(.hidden)
        .fullScreenCover(item: $selectedStory) { story in
            StoryView(stories: stories, initialStory: story)
        }
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
    }
}
