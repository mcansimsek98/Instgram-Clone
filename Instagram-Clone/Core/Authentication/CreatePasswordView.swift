//
//  CreatePasswordView.swift
//  Instagram-Clone
//
//  Created by Mehmet Can Şimşek on 27.11.2024.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password: String = ""
    @Environment(\.dismiss) var dissmiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create Password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password must be at least 6 characters length.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink {
                CompleteSingUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 40)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dissmiss()
                    }
            }
        }
    }
}


#Preview {
    CreatePasswordView()
}
