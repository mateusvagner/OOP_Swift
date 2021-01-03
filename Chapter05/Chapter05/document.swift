//
//  document.swift
//  Chapter05
//
//  Created by Mateus Vagner Guedes de Almeida on 03/01/21.
//

import Foundation

class Document {
    let fileName: String
    
    var characters: [Character] = []
   
    lazy var cursor: Cursor = Cursor(document: self)
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func insert(_ character: Any) {
        if let characterChar = character as? Character {
            characters.insert(characterChar, at: cursor.position)
            cursor.forward()
        }
        
        if let characterStr = character as? String {
            let characterObj = Character(character: characterStr)
            characters.insert(characterObj, at: cursor.position)
            cursor.forward()
        }

    }
    
    func delete() {
        characters.remove(at: cursor.position)
    }
    
    
    func forward() {
        cursor.forward()
    }
    
    func back() {
        cursor.back()
    }
    
    func string() -> String {
        let text = self.characters.map { $0.characterString }
        return text.joined(separator: "")
    }

    
}
