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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts =  try snapshot.documents.compactMap({ try $0.data(as: PostModel.self) })
    }
}
