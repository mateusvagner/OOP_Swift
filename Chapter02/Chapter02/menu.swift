//
//  Menu.swift
//  Chapter02
//
//  Created by Mateus Vagner Guedes de Almeida on 04/10/20.
//

import Foundation

class Menu {
    private var notebook = Notebook()
    
    var running = true
    public func run() {
        while (running) {
            displayMenu()
            print("Enter an Option: ")
            let input = readLine()
            switch (input) {
            case "1":
                showNotes(notebook.notes)
            case "2":
                searchNotes()
            case "3":
                addNote()
            case "4":
                modifyNote()
            case "5":
                quit()
            default:
                print("Non a valid option!!")
            }
        }
    }
    
    private func displayMenu() {
        print("""
                Notebook Menu:
                    1. Show all Notes
                    2. Search Notes
                    3. Add Note
                    4. Modify Note
                    5. Quit
                """)
    }
    
    private func showNotes(_ notes: [Note]? = nil) {
        guard let notes = notes else {
            print("Empty List.")
            return
        }
        
        notes.forEach {
            print("Note Id: \($0.id)")
            print("   Tags: \($0.tags)")
            print("   Memo: \($0.memo)")
        }
    }
    
    private func searchNotes() {
        print("Search for: ")
        let filter =  readLine()!
        let notes = notebook.search(filter)
        showNotes(notes)
    }
    
    private func addNote() {
        print("Enter a memo: ")
        let memo =  readLine()!
        print("Enter a tag: ")
        let tag =  readLine()!
        
        notebook.newNote(10, memo, tag)
        print("Your note has been added.")
    }
    
    private func modifyNote() {
        print("Enter Note Id to modify: ")
        let id = Int(readLine()!) ?? 0
        
        let filteredNotesIsEmpty = notebook.notes.filter { $0.id == id }.isEmpty
        
        if (filteredNotesIsEmpty) {
            print("There is no Note with this Id")
        } else {
            performModification(id)
        }
    }
    
    private func performModification(_ id: Int) {
        print("Enter a memo: ")
        let memo =  readLine()!
        
        if (!memo.isEmpty) {
            notebook.modifyMemo(id, memo)
        }
        
        print("Enter a tag: ")
        let tag =  readLine()!
        
        if(!tag.isEmpty) {
            notebook.modifyTags(id, tag)
        }
    }
    
    private func quit() {
        print("Thanks for using notebook today")
        running = false
    }
}
