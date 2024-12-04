//
//  EditProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore

final class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var profileImage: Image?
    @Published var fullname: String = ""
    @Published var bio: String = ""
    @Published var seledtedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: seledtedImage)} }
    }
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        fullname = user.fullname ?? ""
        bio = user.bio ?? ""
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else {
            return
        }
        
        self.profileImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    @MainActor
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage, refPath: .profileImages)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
