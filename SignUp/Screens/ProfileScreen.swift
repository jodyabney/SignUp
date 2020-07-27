//
//  ProfileScreen.swift
//  SignUp
//
//  Created by Jody Abney on 7/24/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct ProfileScreen: View {
    
    //MARK: - Data Dependencies
    @State var profile = Profile()
    @State var selectedAvatar: Avatar = .none
    
    //MARK: - Properties

    //MARK: - View
    var body: some View {
        ZStack {
            // set view background color
            setBackgroundColor(avatar: selectedAvatar)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // header area
                Text("Sign up")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.bottom)
                Text("WHO YOU ARE?")
                    .foregroundColor(Color.init("titleColor"))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                
                // avatars area
                HStack {
                    AvatarIcon(selectedAvatar: $selectedAvatar, avatar: .parent)
                    AvatarIcon(selectedAvatar: $selectedAvatar, avatar: .child)
                    AvatarIcon(selectedAvatar: $selectedAvatar, avatar: .teacher)
                }
                .padding(.bottom)
                
                // profile entry area
                VStack {
                    UserNameTextField(profile: $profile,
                                      selectedAvatar: selectedAvatar)
                        .padding([.top, .bottom])
                    EmailTextField(profile: $profile,
                                   selectedAvatar: selectedAvatar)
                    .padding(.bottom)
                    PasswordSecureField(profile: $profile,
                                        selectedAvatar: selectedAvatar)
                    .padding(.bottom)
                    ConfirmPasswordSecureField(profile: $profile)
                    .padding(.bottom)
                    SignUpButton(profile: $profile,
                                 selectedAvatar: $selectedAvatar)
                        .padding(.bottom)
                }
                .padding(.horizontal, 25.0)
                
                // footer area
                HStack {
                    Text("Already have an account.")
                        .foregroundColor(.white)
                    Text("Login here")
                        .foregroundColor(.orange)
                }
            }
        }
    }
    
    //MARK: - Helper Functions
    func setBackgroundColor(avatar: Avatar) -> Color {
        switch avatar {
        case .none:
            return Color.init("defaultBackground")
        case .parent:
            return Color.init("parentBackground")
        case .child:
            return Color.init("childBackground")
        case .teacher:
            return Color.init("teacherBackground")
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


