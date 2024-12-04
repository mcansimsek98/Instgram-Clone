//
//  UserService.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import Foundation
import Firebase
import FirebaseAuth

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let currentUid = Auth.auth().currentUser?.uid
        
        return snapshot.documents.compactMap { document in
            try? document.data(as: User.self)
        }.filter({$0.id != currentUid})
    }
}
