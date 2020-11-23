//
//  authException.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

enum AuthException: Error {
    case UserNameAlreadyExists(_ username: String)

    case PasswordTooShort(_ username: String)

    case InvalidUsername(_ username: String)

    case InvalidPassword(_ username: String, _ user: User? = nil)

    case PermissionError(_ message: String)

    case NotLoggedInError(_ username: String?)

    case NotPermittedError(_ username: String)
}
