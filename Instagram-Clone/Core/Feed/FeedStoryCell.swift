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
                    ZStack {
                        ZStack {
                            Circle().stroke(
                                Gradient(colors: story?.isSeen == true ?
                                         [.gray] : [.green, .orange, .yellow, .red, .green]),
                                lineWidth: 5)
                            
                            let size: CGFloat = story?.stories.count == 0 ? 80 : 72
                            Image(story?.user?.profileImage ?? "person")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size, height: size)
                                .clipShape(Circle())
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        
                        if story?.isSeen == true {
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
                    }
                    .padding(4)
                default:
                    ZStack {
                        Circle().stroke(
                            Gradient(colors: story?.isSeen == true ?
                                     [.gray] : [.green, .orange, .yellow, .red, .green]),
                            lineWidth: 5)

                        Image(story?.user?.profileImage ?? "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
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

#Preview {
    FeedStoryCell(story: StoryModel.MOCK_STORIES[0])
}
