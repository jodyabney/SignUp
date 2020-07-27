//
//  ConfirmPasswordSecureField.swift
//  SignUp
//
//  Created by Jody Abney on 7/26/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct ConfirmPasswordSecureField: View {
    
    //MARK: - Data Dependencies
    @Binding var profile: Profile
    
    //MARK: - Properties
    
    
    //MARK: - View
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .overlay(
                    Capsule()
                        .stroke(profile.isMatchingPassword ? Color.init("titleColor") : Color.red, lineWidth: 4)
            )
                .frame(height: 40)
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.secondary)
                SecureField("Confirm Password", text: $profile.confirmPassword)
                    .disabled(profile.isPasswordValid ? false : true)
            }
            .padding(.leading)
        }
    }
}

struct ConfirmPasswordSecureField_Previews: PreviewProvider {
    @State static var profile = Profile()
    static var previews: some View {
        ConfirmPasswordSecureField(profile: $profile)
    }
}
