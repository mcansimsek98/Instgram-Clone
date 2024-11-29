//
//  StoryModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 28.11.2024.
//

import Foundation
import SwiftUI

enum StoryType: Codable {
    case curentUserStory
    case otherUserStory
}

struct StoryModel: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var ownerUid: String = UUID().uuidString
    var timeStamp: Date = Date()
    var user: User?
    var isSeen: Bool
    var storyType: StoryType = .otherUserStory
    let stories: [String]
}

extension StoryModel {
    static var MOCK_STORIES: [StoryModel] = [
//        .init(user: User.MOCK_USERS[0], isSeen: true, stories: ["person_1", "post_1", "person_2"]),
        .init(user: User.MOCK_USERS[1], isSeen: false, stories: ["person_1", "post_1", "person_2"]),
        .init(user: User.MOCK_USERS[2], isSeen: true, stories: ["person_3", "post_2", "person_5"]),
        .init(user: User.MOCK_USERS[3], isSeen: false, stories: ["person_4", "post_2", "person_4"]),
        .init(user: User.MOCK_USERS[5], isSeen: false, stories: ["person_5", "post_3", "person_1"]),
    ]
}
