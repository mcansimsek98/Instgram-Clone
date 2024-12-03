//
//  LoginViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func singIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
