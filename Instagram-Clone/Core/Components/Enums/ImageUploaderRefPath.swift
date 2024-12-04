//
//  ImageUploaderRefPath.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation

enum ImageUploaderRefPath: String {
    case profileImages
    case postsImages
    
    var path: String {
        switch self {
        case .profileImages: return "profile/images/"
        case .postsImages: return "posts/images/"
        }
    }
}
