//
//  UserStatView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 25.11.2024.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}
