//
//  Texts.swift
//  Chatify
//
//  Created by Kaan Uzman on 29/2/24.
//

import Foundation

struct Texts {
    enum Login: String {
        case title = "Hello Chatify!"
    }
    
    enum Fields: String {
        case emailPlaceholder = "Your email"
        case passwordPlaceholder = "Your password"
        case confirmPasswordPlaceholder = "Confirm your password"
    }
    
    enum Buttons: String {
        case signIn = "Sign In"
        case signUp = "Sign Up"
    }
}
