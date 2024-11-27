//
//  PostGridView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct PostGridView: View {
    private let imageDimensions: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let posts: [PostModel]

    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimensions, height: imageDimensions)
                    .clipped()
                
            }
        }
    }
}

#Preview {
    PostGridView(posts: PostModel.MOCK_POTS)
}
