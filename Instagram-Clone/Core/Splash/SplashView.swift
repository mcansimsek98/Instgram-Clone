//
//  SplashView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 3.12.2024.
//

import SwiftUI

struct SplashView: View {
    private let size = UIScreen.main.bounds.width * 0.2
    
    var body: some View {
        Image(.logo)
            .resizable()
            .frame(width: size, height: size)
    }
}
