//
//  Notebook.swift
//  Chapter02
//
//  Created by Mateus Vagner Guedes de Almeida on 04/10/20.
//

import Foundation

public class Notebook {
    var notes: [Note]
    
    // Initialize a notebook with and empty list.
    init(_ notes: [Note] = []) {
        self.notes = notes
    }
    
    func newNote(_ id: Int, _ memo: String, _ tags: String = "") {
        // Create a new note and add it to the list.
        notes.append(Note(id, memo, tags))
    }
    
    func modifyMemo(_ noteId: Int, _ memo: String) {
        // Find the note with the given Id and change its memo to the given value.
        notes.first { $0.id == noteId }?.memo = memo
    }
    
    func modifyTags(_ noteId: Int, _ tags: String) {
        // Find the note with the given Id and change its tags to the given value.
        notes.first { $0.id == noteId }?.tags = tags
    }
    
    func search(_ searchingWord: String) -> [Note] {
        // Find all notes that match given filter string.
        return notes.filter { $0.match(searchingWord) }
    }
}
