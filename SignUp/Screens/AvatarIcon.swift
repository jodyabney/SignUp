//
//  AvatarIcon.swift
//  SignUp
//
//  Created by Jody Abney on 7/25/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import SwiftUI

struct AvatarIcon: View {
    @Binding var selectedAvatar: Avatar
    
    //MARK: - Properties
    var avatar: Avatar
    
    var body: some View {
        VStack {
            Image(avatar.rawValue)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 100)
            Text(avatar.rawValue.uppercased())
                .foregroundColor(.white)
        }
        .border(selectedAvatar == avatar ? Color.black : Color.clear)
        .onTapGesture {
            if self.selectedAvatar == self.avatar {
                self.selectedAvatar = Avatar.none
            } else {
                self.selectedAvatar = self.avatar
            }
        }
    }
}
