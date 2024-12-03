//
//  GalleryImagePicker.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 28.11.2024.
//

import SwiftUI
import PhotosUI

struct GalleryImagePicker: View {
    private let imageDimensions: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    @State private var images: [ImageItem] = []
    @State private var isPhotoAccessGranted = false
    @State private var selectedImageID: UUID? = nil
    @State private var navigateToUploadPost = false
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 2) {
                if let selectedID = selectedImageID,
                   let selectedImage = images.first(where: { $0.id == selectedID })?.image {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.width - 50)
                        .clipShape(Rectangle())
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 1),
                                        GridItem(.flexible(), spacing: 1),
                                        GridItem(.flexible(), spacing: 1)], spacing: 1) {
                        ForEach(images) { item in
                            Image(uiImage: item.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageDimensions, height: imageDimensions)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 0)
                                        .stroke(selectedImageID == item.id ? Color.blue : Color.clear, lineWidth: 3)
                                )
                                .onTapGesture {
                                    selectedImageID = item.id
                                }
                        }
                    }.padding(.top, 2)
                }
                Spacer()
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .onTapGesture {
                            navigateToUploadPost = true
                        }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Cancel")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .onTapGesture {
                            images = []
                            tabIndex = 0
                        }
                }
            }
            .navigationDestination(isPresented: $navigateToUploadPost) {
                if let selectedID = selectedImageID,
                   let selectedImage = images.first(where: { $0.id == selectedID })?.image {
                    UploadPostView(selectedImage: selectedImage)
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .onAppear(perform: checkPhotoAccess)
        .onDisappear() {
            images = []
            selectedImageID = nil
            isPhotoAccessGranted = false
        }
    }
    
    private func checkPhotoAccess() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch status {
        case .authorized, .limited:
            isPhotoAccessGranted = true
            fetchGalleryImages()
            
        case .denied, .notDetermined, .restricted:
            isPhotoAccessGranted = false
            requestPhotoAccess()
        @unknown default:
            isPhotoAccessGranted = false
            requestPhotoAccess()
        }
    }
    
    private func requestPhotoAccess() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                if status == .authorized || status == .limited {
                    isPhotoAccessGranted = true
                    fetchGalleryImages()
                } else {
                    isPhotoAccessGranted = false
                }
            }
        }
    }
    
    private func fetchGalleryImages() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        let imageManager = PHCachingImageManager()
        fetchResult.enumerateObjects { asset, _, _ in
            let targetSize = PHImageManagerMaximumSize
            let options = PHImageRequestOptions()
            options.deliveryMode = .highQualityFormat
            options.isSynchronous = false
            options.resizeMode = .none
            
            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options) { image, info in
                if let image = image {
                    images.append(ImageItem(image: image))
                    
                    if selectedImageID == nil {
                        selectedImageID = images.first?.id
                    }
                }
            }
        }
    }
    
}

//#Preview {
//    GalleryImagePicker(tabIndex: .constant(0))
//}
