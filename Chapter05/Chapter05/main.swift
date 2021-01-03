//
//  main.swift
//  Chapter05
//
//  Created by Mateus Vagner Guedes de Almeida on 03/01/21.
//

import Foundation

let doc = Document(fileName: "test_document")

doc.insert("h")
doc.insert("e")
doc.insert(Character(character: "l", bold: true))
doc.insert(Character(character: "l", bold: true))
doc.insert("o")
doc.insert("\n")
doc.insert(Character(character: "w", italic: true))
doc.insert(Character(character: "o", italic: true))
doc.insert(Character(character: "r", underline: true))
doc.insert("l")
doc.insert("d")

print(doc.string())

doc.cursor.home()
doc.delete()
doc.insert("W")

print(doc.string())

doc.characters[0].underline = true

print(doc.string())

