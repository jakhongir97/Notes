//
//  NotesDetailInteractor.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import Foundation

class NotesDetailInteractor: NotesDetailInteractorInputProtocol {
    
    weak var presenter: NotesDetailInteractorOutputProtocol?
    var notes = [Note]()
    var note: Note?
    
    func deleteNote() {
        guard let _ = note else { return }
        presenter?.didDeleteNote()
    }
    
    func editNote(title: String?, detail: String?) {
        guard let note = note else { return }
        self.note?.title = title
        self.note?.detail = detail
        presenter?.didEditNote(note)
    }
}
