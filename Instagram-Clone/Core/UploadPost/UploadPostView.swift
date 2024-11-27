//
//  UploadPostView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var imagePicerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            /// Action tool bar
            HStack {
                Button{
                    caption = ""
                    viewModel.postImage = nil
                    viewModel.selectedImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color(.systemBlue))
                
                Spacer()
                Text("New Post")
                    .fontWeight(.bold)
                Spacer()

                Button{
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color(.systemBlue))
            }
            .padding(.horizontal)
            
            /// Post image and camption
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            imagePicerPresented = true
                        }
                }else {
                    Image("uploadImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            imagePicerPresented = true
                        }
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePicerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePicerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
