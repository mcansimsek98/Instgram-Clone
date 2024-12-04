//
//  FeedStoryCell.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 28.11.2024.
//

import SwiftUI

struct FeedStoryCell: View {
    let story: StoryModel?
    
    var body: some View {
        VStack {
            ZStack {
                switch story?.storyType {
                case .curentUserStory:
                    VStack {
                        ZStack {
                            ZStack {
                                Circle().stroke(
                                    Gradient(colors: story?.stories.first?.isSeen == true ?
                                             [.gray] : [.green, .orange, .yellow, .red, .green]),
                                    lineWidth: 5)
                                
                                let size: CGFloat = story?.stories.count == 0 ? 80 : 72
                                CircularProfileImageView(user: story?.user, size: .custom(size))
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Color(.systemBackground)
                                        
                                        Text("+")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .frame(width: 22, height: 22)
                                            .background(Color.blue)
                                            .clipShape(Circle())
                                    }
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                }
                            }
                        }
                        .padding(4)
                    }
                default:
                    ZStack {
                        Circle().stroke(
                            Gradient(colors: story?.stories.first?.isSeen == true ?
                                     [.gray] : [.green, .orange, .yellow, .red, .green]),
                            lineWidth: 5)
                        
                        CircularProfileImageView(user: story?.user, size: .custom(72))
                    }
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                }
            }
            .padding(.top, 4)
            
            Text(story?.user?.username ?? "")
                .font(.footnote)
                .foregroundColor(.igBlack)
        }
    }
}
