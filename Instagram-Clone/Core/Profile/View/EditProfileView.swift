//
//  EditProfileView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            //Tool bar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                Divider()
            }
            
            PhotosPicker(selection: $viewModel.seledtedImage) {
                VStack(spacing: 8) {
                    VStack {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                        }else {
                            CircularProfileImageView(user: viewModel.user, size: .large)
                        }
                    }
                    .frame(width: 80, height: 80)
                    .foregroundColor(.igWhite)
                    .clipShape(Circle())
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Divider()
                }
            }
            .padding(.vertical)
            
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter your fullname...", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            Spacer()
        }
    }
}


//#Preview {
//    EditProfileView(user: User.MOCK_USERS[0])
//}
