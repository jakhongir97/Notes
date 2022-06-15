//
//  NotesListInteractor.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import Foundation

class NotesListInteractor: NotesListInteractorInputProtocol {
    
    weak var presenter: NotesListInteractorOutputProtocol?
    
    var notes = [Note]()
    
    func retrieveNotes() {
        presenter?.didRetrieveNotes(notes)
    }
    
    func saveNote(_ note: Note) {
        notes.append(note)
        presenter?.didAddNote(note)
    }
    
    func deleteNote(_ note: Note) {
        presenter?.didRemoveNote(note)
    }
}
