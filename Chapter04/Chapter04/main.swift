//
//  main.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

print("Enter an Message: ")
let input = readLine()

let auth = Authenticator()

do {
    try auth.addUser(username: input!, password: "123") // todo "try" em que eu tentar tem que ser em um método/funçao que é throws?
} catch AuthException.UserNameAlreadyExists(let errorMessage) {
    print(errorMessage)
}

