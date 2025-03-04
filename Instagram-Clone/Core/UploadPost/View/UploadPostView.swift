//
//  UploadPostView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: UploadPostViewModel
    @Binding var uploadedPost: Bool

    init(selectedImage: UIImage?, uploadedPost: Binding<Bool>, user: User) {
        self._viewModel = StateObject(wrappedValue: UploadPostViewModel(selectedImage: selectedImage, user: user))
        self._uploadedPost = uploadedPost
    }
    
    var body: some View {
        VStack {
            /// Post image and camption
            HStack {
                if let image = viewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            clearPostData()
                        }
                }else {
                    Image("uploadImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            clearPostData()
                        }
                }
                TextField("Enter your caption...", text: $viewModel.caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("New Post")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Upload")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                    .onTapGesture {
                        Task {
                            try await viewModel.uploadPost()
                            clearPostData(true)
                        }
                    }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundColor(Color(.systemBlue))
                    .onTapGesture {
                        clearPostData()
                    }
            }
        }
    }
    
    private func clearPostData(_ goHome: Bool = false) {
        viewModel.caption = ""
        viewModel.selectedImage = nil
        dismiss()
        uploadedPost = goHome
    }
}
