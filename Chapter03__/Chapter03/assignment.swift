//
//  assignment.swift
//  Chapter03
//
//  Created by Mateus Vagner Guedes de Almeida on 19/10/20.
//

import Foundation

protocol Assignment {
    
    var student: String { get set }
    func lesson()
    func check(code: String) -> Bool
    
}
