//
//  ProfileImageSize.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation

enum ProfileImageSize {
    /// Size : 40
    case xsmall
    
    /// Size : 48
    case small
    
    /// Size : 64
    case medium
    
    /// Size : 80
    case large
    
    /// Custom Size
    case custom(CGFloat)
    
    
    var dimaension: CGFloat {
        switch self {
        case .xsmall: return 40
        case .small: return 48
        case .medium: return 64
        case .large: return 80
        case .custom(let size): return size
        }
    }
}
