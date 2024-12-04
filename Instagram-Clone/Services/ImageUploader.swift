//
//  ImageUploader.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

struct ImageUploader {
    
    static func uploadImage(image: UIImage, refPath: ImageUploaderRefPath) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let ref = Storage.storage().reference(withPath: refPath.path + UUID().uuidString)
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }catch {
            print("DEBUG: Error uploading image")
            return nil
        }
    }
}
