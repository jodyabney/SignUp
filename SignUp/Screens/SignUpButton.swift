//
//  SignUpButton.swift
//  SignUp
//
//  Created by Jody Abney on 7/26/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct SignUpButton: View {
    
    //MARK: - Data Dependencies
    @Binding var profile: Profile
    @Binding var selectedAvatar: Avatar
    
    //MARK: - Computed Properties
    var isAvatarSelected: Bool {
        return selectedAvatar != .none
    }
    
    var shouldButtonBeEnabled: Bool {
        if isAvatarSelected &&
            profile.isUsernameValid &&
            profile.isEmailValid &&
            profile.isPasswordValid &&
            !profile.isPasswordBlank &&
            profile.isMatchingPassword {
            return true
        } else {
            return false
        }
    }
    
    //MARK: - View
    var body: some View {
        ZStack {
            if shouldButtonBeEnabled {
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 60, alignment: .center)
            } else {
                Capsule()
                    .fill(Color.gray)
                    .frame(height: 60, alignment: .center)
            }
            Text("SIGNUP")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding([.top, .bottom], 25)
        .onTapGesture {
            // handle the creation of the user account accordingly
            // if this were a real app with network services and
            // user management
            
            // reset the profile
            self.profile.reset()
            // reset the avatar selection
            self.selectedAvatar = .none
        }
        .disabled(!shouldButtonBeEnabled)
    }
}
