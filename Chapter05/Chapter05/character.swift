//
//  character.swift
//  Chapter05
//
//  Created by Mateus Vagner Guedes de Almeida on 03/01/21.
//

import Foundation

class Character {
    
    let character: String
    var bold: Bool
    var italic: Bool
    var underline: Bool
    
    var characterString: String {
        getString()
    }
    
    
    init(character: String, bold: Bool, italic: Bool, underline: Bool) {
        self.character = character
        self.bold = bold
        self.italic = italic
        self.underline = underline
       
    }
    
    private func  getString() -> String {
        let boldCharacter = bold ? "*" : ""
        let italicCharacter = italic ? "/" : ""
        let underlineCharacter = underline ? "_" : ""
      
        return boldCharacter + italicCharacter + underlineCharacter + character
    }
}
