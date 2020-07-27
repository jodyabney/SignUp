//
//  UsernameTextField.swift
//  SignUp
//
//  Created by Jody Abney on 7/25/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct UserNameTextField: View {
    
    //MARK: - Data Dependencies
    @Binding var profile: Profile
    
    //MARK: - Properties
    var selectedAvatar: Avatar
    let placeholderText = String()
    
    //MARK: - View
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .overlay(
                    Capsule()
                        .stroke(Color.init("titleColor"), lineWidth: 4)
            )
                .frame(height: 40)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.secondary)
                TextField("Username", text: $profile.username)
                    .disabled(selectedAvatar == .none ? true : false)
            }
            .padding(.leading)
        }
    }
}

struct UserNameTextField_Previews: PreviewProvider {
    @State static var profile = Profile()
    static var previews: some View {
        UserNameTextField(profile: $profile,
                          selectedAvatar: Avatar.child)
    }
}
