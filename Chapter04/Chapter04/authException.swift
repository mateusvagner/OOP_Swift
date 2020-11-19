//
//  authException.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

enum AuthException: Error {
    case UserNameAlreadyExists(username: String)

    case PasswordTooShort(username: String)

    case InvalidUsername(username: String)

    case InvalidPassword(username: String, user: User? = nil)

    case PermissionError(message: String)

    case NotLoggedInError(username: String?)

    case NotPermittedError(username: String)
}
