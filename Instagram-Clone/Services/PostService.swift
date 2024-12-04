//
//  PostService.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

final class PostService {
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchPosts() async throws -> [PostModel] {
        let snapshot = try await postCollection.getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: PostModel.self) })
    }
    
    static func fetchUserPosts(uid: String) async throws -> [PostModel] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: PostModel.self) })
    }
}
