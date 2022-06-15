//
//  NotesDetailInteractor.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import Foundation

class NotesDetailInteractor: NotesDetailInteractorInputProtocol {
    
    weak var presenter: NotesDetailInteractorOutputProtocol?
    
    let coreDataController = CoreDataController(persistenceManager: .shared)
    
    var note: Note?
    
    func deleteNote() {
        guard let note = note else { return }
        coreDataController.removeNote(id: note.id)
        presenter?.didDeleteNote()
    }
    
    func editNote(title: String?, detail: String?) {
        guard var note = note else { return }
        note.title = title
        note.detail = detail
        coreDataController.addNote(id: note.id, title: title, detail: detail, date: .now)
        presenter?.didEditNote(note)
    }
}
