//
//  UploadPostViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var postImage: Image?

    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromIten: selectedImage) } }
    }
    
    func loadImage(fromIten Item: PhotosPickerItem?) async {
        guard let Item, let data = try? await Item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else {
            return
        }
        
        postImage = Image(uiImage: uiImage)
    }
}
