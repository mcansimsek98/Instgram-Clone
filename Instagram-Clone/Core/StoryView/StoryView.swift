//
//  StoryView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 29.11.2024.
//

import SwiftUI

struct StoryView: View {
    @Environment(\.dismiss) var dismiss
    @State var users: [StoryModel]
    @State private var currentUserIndex: Int
    @State private var currentStoryIndex: Int = 0
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?
    @State private var message: String = ""
    
    init(users: [StoryModel], initialStory: StoryModel) {
        self.users = users
        self._currentUserIndex = State(initialValue: users.firstIndex(where: { $0.id == initialStory.id }) ?? 0)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        let currentUser = users[currentUserIndex]
                        let currentStory = currentUser.stories[currentStoryIndex].image
                        
                        Image(currentStory)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                        
                        VStack {
                            HStack(spacing: 4) {
                                ForEach(0..<currentUser.stories.count, id: \.self) { index in
                                    ProgressView(progress: getProgress(for: index))
                                        .frame(height: 4)
                                        .animation(.linear, value: progress)
                                }
                            }
                            .padding(.top, 8)
                            .padding(.horizontal, 5)
                            
                            HStack {
                                Image(currentUser.user?.profileImage ?? "person")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                Text(currentUser.user?.username ?? "")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding(.trailing)
                                }
                            }
                            .padding(.top, 3)
                            .padding(.horizontal, 14)
                            
                            Spacer()
                        }
                    }
                }
                .cornerRadius(8)
                
                TextField("Send a message..", text: $message)
                    .modifier(IGTextFieldCommentModifier())
                    .padding(.top, 4)
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
    
    private func getProgress(for index: Int) -> CGFloat {
        if index < currentStoryIndex { return 1.0 }
        if index == currentStoryIndex { return progress }
        return 0.0
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            progress += 0.01
            if progress >= 1.0 {
                progress = 0.0
                currentStoryIndex += 1
                
                if currentStoryIndex >= users[currentUserIndex].stories.count {
                    currentStoryIndex = 0
                    currentUserIndex += 1
                    
                    if currentUserIndex >= users.count {
                        dismiss()
                        stopTimer()
                    }
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        progress = 0.0
        currentStoryIndex = 0
        currentUserIndex = 0
    }
}


//#Preview {
//    StoryView(users: StoryModel.MOCK_STORIES, initialStory: StoryModel.MOCK_STORIES[0])
//}
