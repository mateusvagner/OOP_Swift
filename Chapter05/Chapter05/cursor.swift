//
//  cursor.swift
//  Chapter05
//
//  Created by Mateus Vagner Guedes de Almeida on 03/01/21.
//

import Foundation

class Cursor {
    private let document: Document
    var position: Int = 0
    
    init(document: Document) {
        self.document = document
    }
    
    func forward() {
        position += 1
    }
    
    func back() {
        position -= 1
    }
    
    func home() {
        while (document.characters[position-1].character != "\n") {
            if (position == 0) { break } // Got to beginning of file
            position -= 1
        }
    }
    
    func end() {
        while (position < document.characters.count && document.characters[position].character != "\n") {
            position += 1
        }
    }
}
