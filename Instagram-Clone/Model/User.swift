//
//  User.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    let id: String
    var username: String
    var profileImage: String?
    var fullName: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "mehmetcan", profileImage: "person_6", fullName: "Mehmet Can Şimşek", bio: "iOS Developer", email: "mehmet.can@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "serapdmr", profileImage: "person_3", fullName: "Serap Demir", bio: "Student", email: "serap.dmr@gmail.com"),

        .init(id: NSUUID().uuidString, username: "hacismsk", profileImage: "person_2", fullName: "Hacı Şimşek", bio: "Software Developer", email: "haci.smsk@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "ufukorhn", profileImage: "person_1", fullName: "Ufuk Orhan", bio: "Backend Developer", email: "ufu.korhan@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "senakrtk", profileImage: nil, fullName: "Sena Kurtak", bio: "Domain Manager", email: "sena.krtk@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "muratkocdag", profileImage: "person_5", fullName: nil, bio: "Front-End Developer", email: "murat.kocdag@gmail.com"),
    ]
}
