//
//  FeedViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import Firebase

final class FeedViewModel: ObservableObject {
    @Published var stories: [StoryModel] = []
    @Published var posts: [PostModel] = []
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchPosts()
    }
}
