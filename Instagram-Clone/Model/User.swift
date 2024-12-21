//
//  User.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import Foundation
import FirebaseAuth

struct User: Codable, Hashable, Identifiable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "mehmetcan", profileImageUrl: "", fullname: "Mehmet Can Şimşek", bio: "iOS Developer", email: "can@gmail.com"),

            .init(id: NSUUID().uuidString, username: "hacismsk", profileImageUrl: "person_5", fullname: "Hacı Şimşek", bio: "Engineer", email: "haci@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "ufukorhn", profileImageUrl: "person_1", fullname: "", bio: "Backend Developer", email: "ufuk@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "arzsmsk", profileImageUrl: nil, fullname: "Arzu", bio: "Manager", email: "arzu@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "muratkocdag", profileImageUrl: "person_5", fullname: nil, bio: "Front-End Developer", email: "murat@gmail.com"),
    ]
}
