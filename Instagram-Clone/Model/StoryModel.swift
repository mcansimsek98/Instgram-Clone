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
    var storyType: StoryType = .otherUserStory
    let stories: [StoryImageModel]
}

struct StoryImageModel: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    let image: String
    let isSeen: Bool
}

extension StoryModel {
    static var MOCK_STORIES: [StoryModel] = [
        .init(user: User.MOCK_USERS[0], stories: [StoryImageModel(image: "post_2", isSeen: true), StoryImageModel(image: "post_3", isSeen: false)]),
        .init(user: User.MOCK_USERS[1], stories: [StoryImageModel(image: "person_2", isSeen: true)]),
        .init(user: User.MOCK_USERS[2], stories: [StoryImageModel(image: "person_4", isSeen: true), StoryImageModel(image: "person_5", isSeen: false)]),
        .init(user: User.MOCK_USERS[3], stories: [StoryImageModel(image: "person_3", isSeen: true), StoryImageModel(image: "person_1", isSeen: false)]),
        .init(user: User.MOCK_USERS[5], stories: [StoryImageModel(image: "person_5", isSeen: true), StoryImageModel(image: "person_4", isSeen: false)]),
    ]
}
