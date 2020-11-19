//
//  user.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

class User {
    private var username: String
    private var password: String
    
    var isLoggedIn = false
    
    var encryptedPassword: String {
        encryptPassword(self.password)
    }
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    private func encryptPassword(_ password: String) -> String {
        let userPlusPassword = self.username + password
        let encrypt = userPlusPassword
        return encrypt
    }
    
    func checkPassword(_ password: String) -> Bool {
        return encryptPassword(password) == encryptedPassword
    }
    
}
