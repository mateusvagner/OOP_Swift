//
//  grader.swift
//  Chapter03
//
//  Created by Mateus Vagner Guedes de Almeida on 20/10/20.
//

import Foundation

class Grader {
    
    private var studentGrades: [String: AssignmentGrader] = [:]
    private var assignmentClasses: [Int: (String) -> Assignment] = [:]

    func register(assignment: @escaping (String) -> Assignment) -> Int {
        // The closure passed to register(assignment:) is executed immediately within the register(assignment:) function.
        //  @escaping prevent the closure execute immediately
        
        let id = UUID().hashValue
        self.assignmentClasses[id] = assignment
        
        return id
    }
    
    func startAssignment(student: String, id: Int) {
        self.studentGrades[student] = AssignmentGrader(student: student, lessonConstructor: assignmentClasses[id]!)
    }
    
    func getLesson(student: String) {
        let assignment = self.studentGrades[student]!
        assignment.lesson()
    }
    
    func checkAssignment(student: String, code: String) -> Bool {
        let assignment = self.studentGrades[student]!
        return assignment.check(code: code)
    }
    
    func assignmentSummary(student: String) {
        let grader = studentGrades[student]!
        print("""
                
            -------- Summary --------
            \(student)'s attempts at \(type(of: grader.assignment)):
             - Attempts: \(grader.attempts)
             - Correct: \(grader.correctAttempts)
             - Passed: \(grader.correctAttempts > 0)
            -------- Summary --------

            """)
    }
    

}
