//
//  ProgressView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 29.11.2024.
//

import SwiftUI

struct ProgressView: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white.opacity(0.3))
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width * progress)
            }
            .cornerRadius(2)
        }
    }
}

//#Preview {
//    ProgressView(progress: 0.5)
//}
