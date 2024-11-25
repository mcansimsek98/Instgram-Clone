//
//  ProfileView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// Header
                VStack(spacing: 10) {
                    // picture and stats
                    HStack {
                        Image(.person6)
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
                        Text("Mehmet Can Şimşek")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("iOS Developer")
                            .font(.footnote)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    /// action button
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1))
                    }
                    
                    Divider()
                }
                
                /// PostGridView
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0 ... 15, id: \.self) { index in
                        Image(.post2)
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {} label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
