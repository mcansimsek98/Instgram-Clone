//
//  ProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import Firebase

final class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var posts: [PostModel] = []
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func fetchUsersPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
    }
}
