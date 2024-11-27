//
//  PostModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import Foundation

struct PostModel: Codable, Identifiable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension PostModel {
    static var MOCK_POTS: [PostModel] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Sunrise 🌅", likes: 134, imageUrl: "post_1", timeStamp: Date(), user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test caption 🌧", likes: 94, imageUrl: "post_2", timeStamp: Date(), user: User.MOCK_USERS[1]),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test caption 🌧", likes: 200, imageUrl: "post_3", timeStamp: Date(), user: User.MOCK_USERS[2]),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test caption 🌧", likes: 122, imageUrl: "post_4", timeStamp: Date(), user: User.MOCK_USERS[0]),
    ]
}
