//
//  EmailTextField.swift
//  SignUp
//
//  Created by Jody Abney on 7/25/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct EmailTextField: View {
    
    //MARK: - Data Dependencies
    @Binding var profile: Profile
    
    //MARK: - Properties
    var selectedAvatar: Avatar
    
    //MARK: - View
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .overlay(
                    Capsule()
                        .stroke(profile.isEmailValid ? Color.init("titleColor") : profile.isEmailBlank ? Color.init("titleColor") : Color.red, lineWidth: 4)
            )
                .frame(height: 40)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.secondary)
                TextField("Email", text: $profile.email)
                    .keyboardType(.emailAddress)
                    .disabled(selectedAvatar == .none ? true : false)
            }
            .padding(.leading)
        }
    }
}

struct EmailTextField_Previews: PreviewProvider {
    @State static var profile = Profile()
    static var previews: some View {
        EmailTextField(profile: $profile, selectedAvatar: Avatar.child)
    }
}
