//
//  authorizor.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 23/11/20.
//

import Foundation

class Authorizor {
    
    private let authenticator: Authenticator
    var permissions: Dictionary = [String: Set<String>]()
    
    init(authenticator: Authenticator) {
        self.authenticator = authenticator
    }
    
    func  addPermission(permName: String) throws {
        if permissions[permName] != nil {
            throw AuthException.PermissionError("Permission Exists")
        } else {
            permissions[permName] = Set()
        }
    }
    
    func permitUser(permName: String, username: String) throws {
        guard var permSet = permissions[permName] else {
            throw AuthException.PermissionError("Permission Does Not Exist.")
        }
        
        if(authenticator.users[username] == nil) {
            throw AuthException.InvalidUsername(username)
        }
        
        permSet.insert(username) // TODO -> no kotlin essa linha funciona
        permissions[permName]?.insert(username)
    }
    
    func checkPermission(permName: String, username: String?) throws -> Bool {
        if !self.authenticator.isLoggedIn(username: username) {
            throw AuthException.NotLoggedInError(username)
        }
        
        guard let permSet = permissions[permName] else {
            throw AuthException.PermissionError("Permission Does Not Exist")
        }
        
        if !permSet.contains(username!) {
            throw AuthException.NotPermittedError(username!)
        } else {
            return true
        }
       
    }
}
