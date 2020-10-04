//
//  Note.swift
//  Chapter02
//
//  Created by Mateus Vagner Guedes de Almeida on 04/10/20.
//

import Foundation

class Note {
    let id: Int
    var memo: String
    var tags: String
    
    init(_ id: Int, _ memo: String = "" , _ tags: String = "") {
        self.id = id
        self.memo = memo
        self.tags = tags
    }
    
    func match(_ filter: String) -> Bool {
        return self.memo.contains(filter) || self.tags.contains(filter)
    }
    
}
