//
//  EditProfileRowView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 4.12.2024.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
            .font(.subheadline)
            .frame(height: 36)
            
        }
    }
}
