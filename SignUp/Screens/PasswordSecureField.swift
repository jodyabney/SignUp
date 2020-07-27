//
//  PasswordSecureField.swift
//  SignUp
//
//  Created by Jody Abney on 7/25/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct PasswordSecureField: View {
    
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
                        .stroke(profile.isPasswordValid ? Color.init("titleColor") : profile.isPasswordBlank ? Color.init("titleColor") : Color.red, lineWidth: 4)
            )
                .frame(height: 40)
            SecureField("Password", text: $profile.password)
                .disabled(selectedAvatar == .none ? true : false)
        }
    }
}
