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
    @State private var caption: String = ""
    @State private var imagePicerPresented = false
    let selectedImage: UIImage?

    var body: some View {
        VStack {
            /// Post image and camption
            HStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            dismiss()
                        }
                }else {
                    Image("uploadImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .onTapGesture {
                            dismiss()
                        }
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Upload")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                    .onTapGesture {
                        
                    }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundColor(Color(.systemBlue))
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

//#Preview {
//    UploadPostView(selectedImage: nil)
//}
