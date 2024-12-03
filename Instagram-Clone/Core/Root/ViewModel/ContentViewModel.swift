//
//  ContentViewModel.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import Foundation
import FirebaseAuth
import Combine

final class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancalable = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setUpScubcribers()
    }
    
    func setUpScubcribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancalable)
    }
}
