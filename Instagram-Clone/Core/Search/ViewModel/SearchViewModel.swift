//
//  SearchViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async throws {
        do {
            users = try await UserService.fetchAllUsers()
        }catch {
            users = []
        }
    }
}
