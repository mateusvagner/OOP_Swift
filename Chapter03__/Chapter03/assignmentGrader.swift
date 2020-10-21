//
//  assignmentGrader.swift
//  Chapter03
//
//  Created by Mateus Vagner Guedes de Almeida on 19/10/20.
//

import Foundation

class AssignmentGrader {
    
    let student: String
    let assignment: Assignment
    
    var attempts = 0
    var correctAttempts = 0
    
    init(student: String, lessonConstructor: (String) -> Assignment) {
        self.student = student
        self.assignment = lessonConstructor(student)
    }
    
    func check(code: String) -> Bool {
        self.attempts += 1
        let isResultCorrect = assignment.check(code: code)
        if (isResultCorrect) {
            self.correctAttempts += 1
        }
        return isResultCorrect
    }
    
    func lesson() {
        self.assignment.lesson()
    }
}
    
    
