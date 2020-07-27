//
//  Profile.swift
//  SignUp
//
//  Created by Jody Abney on 7/24/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import Foundation

struct Profile {
    
    //MARK: - Properties
    var username = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    
    //MARK: - Computed Properties
    var isUsernameValid: Bool {
        return username.count > 0
    }
    var isEmailBlank: Bool {
        return email.count == 0
    }
    
    var isEmailValid: Bool {
        // assume email should never be longer than 100 characters
        if email.count > 100 {
            return false
        }
        // check email format using regex approach
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    var isPasswordBlank: Bool {
        return password.count == 0
    }
    
    var isPasswordValid: Bool {
        return password.count >= 6
    }
    
    var isMatchingPassword: Bool {
        if isPasswordValid && !isPasswordBlank {
            return password == confirmPassword
        } else {
            return true
        }
    }
    
    //MARK: - Helper Function
    mutating func reset() {
        username = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
}
