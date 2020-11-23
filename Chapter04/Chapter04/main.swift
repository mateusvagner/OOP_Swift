//
//  main.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 19/11/20.
//

import Foundation

let authenticator = Authenticator()
let authorizor = Authorizor(authenticator: authenticator)

try authenticator.addUser(username: "joe", password: "joepassword")
try authorizor.addPermission(permName: "test program")
try authorizor.addPermission(permName: "change program")
try authorizor.permitUser(permName: "test program", username: "joe")


Editor(authenticator, authorizor).menu()

