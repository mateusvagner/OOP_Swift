//
//  lessons.swift
//  Chapter03
//
//  Created by Mateus Vagner Guedes de Almeida on 19/10/20.
//

import Foundation

class IntroToSwift: Assignment {
    var student: String
    
    init(student: String) {
        self.student = student
    }
    
    func lesson() {
        print("""
                *** Hello, \(student). Define two variables,
                an integer named 'a' with value 1
                and a string named 'b' with value 'hello'. ****
                """)
    }
    
    func check(code: String) -> Bool {
        return code == "a = 1\nb = 'hello'"
    }
    
}

class Statistics: Assignment {
    var student: String
    
    init(student: String) {
        self.student = student
    }
    
    func lesson() {
        print("""
                **** Good work so far, \(student).
                Now calculate the average of the numbers: 1, 5, 18, -3.
                Assign to a variable named 'avg'. ****
                """)
    }
    
    func check(code: String) -> Bool {
        return code == "5,25"
    }
    
}
