//
//  editor.swift
//  Chapter04
//
//  Created by Mateus Vagner Guedes de Almeida on 23/11/20.
//

import Foundation

class Editor {
    
    private let authenticator: Authenticator
    private let authorizor: Authorizor
    
    var username: String? = nil
    
    init(_ authenticator: Authenticator, _ authorizor: Authorizor) {
        self.authenticator = authenticator
        self.authorizor = authorizor
    }
    
    private func login() {
        var loggedIn = false
        
        while !loggedIn {
            print("username: ")
            let username = readLine()!
            
            print("password: ")
            let password = readLine()!
            
            do {
                try loggedIn = self.authenticator.login(username: username, password: password)
                print("loggedIn: \(loggedIn)")
                self.username = username
            } catch AuthException.InvalidUsername(_) {
                print("Sorry, that username does not exist")
            } catch AuthException.InvalidPassword(_, _) {
                print("Sorry, incorrect password")
            } catch {
                print("Unespected error")
            }
        }
    }
    
    private func isPermitted(permission: String) -> Bool {
        do {
            try _ = authorizor.checkPermission(permName: permission, username: username)
            return  true
        } catch AuthException.NotLoggedInError(_) {
            print("\(username ?? "unknown") is not logged in")
            return false
        } catch AuthException.NotPermittedError(_) {
            print("\(username ?? "unknown") can not \(permission)")
            return false
        } catch {
            print("Unespected error")
            return false
        }
    }
    
    private func test() {
        if isPermitted(permission: "test program") {
            print("Testing program now")
        }
    }
    
    private func change() {
        if isPermitted(permission: "change program") {
            print("Changing program now")
        }
    }
    
    private func quit() {
        exit(EXIT_SUCCESS)
    }
    
    func menu() {
        var answer = ""
    
        while true {
            print("""

                Please enter a command:
                    type:
                        login for Login
                        test for Test
                        change for Change
                        quit for Quit

                """)
            print("Enter a command: ")
            answer = readLine()!
            print("")
            
            switch answer {
            case "login":
                self.login()
            case "test":
                self.test()
            case "change":
                self.change()
            case "quit":
                self.quit()
            default:
                print("\(answer) is not a valid option")
            }
            sleep(UInt32(2.0))
        }
    }
    
    
}

