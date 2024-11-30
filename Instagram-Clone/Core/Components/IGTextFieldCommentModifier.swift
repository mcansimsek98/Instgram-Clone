//
//  IGTextFieldCommentModifier.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 30.11.2024.
//

import SwiftUI

struct IGTextFieldCommentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .font(.subheadline)
            .foregroundColor(.white)
            .background(.clear)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 1)
            )
            .padding(.horizontal, 14)
    }
}
