//
//  UploadPostViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var caption: String = ""
    private let user: User
    
    init(selectedImage: UIImage?, user: User) {
        self.selectedImage = selectedImage
        self.user = user
    }
    
    func uploadPost() async throws {
        guard let selectedImage,
              let uid = Auth.auth().currentUser?.uid,
              let imageUrl = try await ImageUploader.uploadImage(image: selectedImage, refPath: .postsImages) else {
            return
        }
        
        let postRef = Firestore.firestore().collection("posts").document()
        let post = PostModel(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timeStamp: Timestamp(), user: user)
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
}
