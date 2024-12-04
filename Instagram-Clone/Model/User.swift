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
        .init(id: NSUUID().uuidString, username: "mehmetcan", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-ddc5b.firebasestorage.app/o/profile%2Fimages%2FFA23131E-D86A-4359-A4FB-B71217FA2B7E?alt=media&token=d6917cdc-dedc-44a6-aca8-ccf9983a5ef6"
              , fullname: "Mehmet Can Şimşek", bio: "iOS Developer", email: "can@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "serapdmr", profileImageUrl: "person_3", fullname: "Serap Demir", bio: "Student", email: "serap.dmr@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "hacismsk", profileImageUrl: "person_2", fullname: "Hacı Şimşek", bio: "Software Developer", email: "haci.smsk@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "ufukorhn", profileImageUrl: "person_1", fullname: "Ufuk Orhan", bio: "Backend Developer", email: "ufu.korhan@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "senakrtk", profileImageUrl: nil, fullname: "Sena Kurtak", bio: "Domain Manager", email: "sena.krtk@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "muratkocdag", profileImageUrl: "person_5", fullname: nil, bio: "Front-End Developer", email: "murat.kocdag@gmail.com"),
    ]
}
