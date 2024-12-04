//
//  SearchView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xsmall)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }.font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(Color(.igBlack))
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
