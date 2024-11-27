//
//  ProfileHeaderView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            /// picture and stats
            HStack {
                Image(user.profileImage ?? "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 12, title: "Posts")
                    UserStatView(value: 110, title: "Followers")
                    UserStatView(value: 108, title: "Following")
                }
            }
            .padding(.horizontal)
            
            /// name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            /// action button
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.igBlack)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1))
            }
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}