//
//  main.swift
//  Chapter03
//
//  Created by Mateus Vagner Guedes de Almeida on 20/10/20.
//

import Foundation

let grader = Grader()

let introToKotlinId = grader.register { IntroToSwift(student: $0) }
let statisticsId = grader.register { Statistics(student: $0) }

let mateus = "Mateus"

grader.startAssignment(student: mateus, id: introToKotlinId)
print("Mateus' lesson: ")
grader.getLesson(student: mateus)
print("Mateus' check: \(grader.checkAssignment(student: mateus, code: "a = 1 ; b = 'hello'"))")
print("Mateus' other check: \(grader.checkAssignment(student: mateus, code: "a = 1\nb = 'hello'"))")
grader.assignmentSummary(student: mateus)

grader.startAssignment(student: mateus, id: statisticsId)
print("Mateus' lesson: ")
grader.getLesson(student: mateus)
print("Mateus' check: \(grader.checkAssignment(student: mateus, code: "5,25"))")
print("Mateus' other check: \(grader.checkAssignment(student: mateus, code: "6,75"))")
grader.assignmentSummary(student: mateus)



