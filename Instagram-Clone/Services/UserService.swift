//
//  UserService.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { document in
            try? document.data(as: User.self)
        }
    }
}
