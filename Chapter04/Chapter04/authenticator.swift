//
//  authenticator.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

class Authenticator {
    var users: Dictionary = [String: User]()
    
    func addUser(username: String, password: String) throws {
        if self.users[username] == nil {
            throw AuthException.UserNameAlreadyExists("\(username) already exists in users")
        }
        
        if password.count < 6 {
            throw AuthException.PasswordTooShort("Password is too short")
        }
        
        users[username] = User(username: username, password: password)
    }
    
    func login(username: String, password: String) throws -> Bool {
        guard let user = users[username] else {
            throw AuthException.InvalidUsername(username)
        }
        
        if(!user.checkPassword(password)) {
            throw AuthException.InvalidPassword(username, user)
        }
        
        user.isLoggedIn = true
        return true
    }
    
    func isLoggedIn(username: String) -> Bool {
        if users[username] != nil {
            return users[username]!.isLoggedIn
        }
        return false
    }
}
