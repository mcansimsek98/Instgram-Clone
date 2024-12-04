//
//  CircularProfileImageView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User?
    let size: ProfileImageSize
    
    private let placeholderImage: some View = {
        Image(.person).resizable()
            .scaledToFill()
    }()
    
    var body: some View {
        VStack {
            if let imageUrl = user?.profileImageUrl,
               let url = URL(string: imageUrl) {
                KFImage(url)
                    .placeholder({ placeholderImage })
                    .resizable()
                    .scaledToFill()
            }else {
                placeholderImage
            }
        }
        .frame(width: size.dimaension, height: size.dimaension)
        .clipShape(Circle())
    }
}
