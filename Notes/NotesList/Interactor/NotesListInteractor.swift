//
//  NotesListInteractor.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import Foundation

class NotesListInteractor: NotesListInteractorInputProtocol {
    
    weak var presenter: NotesListInteractorOutputProtocol?
    
    let coreDataController = CoreDataController(persistenceManager: .shared)
    
    var notes: [Note] {
        return coreDataController.allNotes().map { Note(id: Int($0.id), title: $0.title, detail: $0.detail, date: $0.date) }
    }
    
    func retrieveNotes() {
        presenter?.didRetrieveNotes(notes)
    }
    
    func saveNote(_ note: Note) {
        coreDataController.addNote(id: note.id, title: note.title, detail: note.detail, date: note.date)
        presenter?.didAddNote(note)
    }
    
    func deleteNote(_ note: Note) {
        coreDataController.removeNote(id: note.id)
        presenter?.didRemoveNote(note)
    }
}
