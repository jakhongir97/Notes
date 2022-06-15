//
//  CoreDataController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit
import CoreData

final class CoreDataController: NSObject {
    
    private let persistenceManager: PersistenceManager
    
    init(persistenceManager: PersistenceManager) {
        self.persistenceManager = persistenceManager
    }
    
    // MARK: - Add
    internal func addNote(id: Int, title: String? = nil, detail: String? = nil, date: Date? = nil) {
        let notes = persistenceManager.fetch(NoteEntity.self, predicateKey: "id", predicateValue: String(id))
        
        if let note = notes.first {
            note.id = Int16(id)
            note.title = title ?? note.title
            note.detail = detail ?? note.detail
            note.date = date ?? note.date
        } else {
            let newNote = NoteEntity(context: persistenceManager.context)
            newNote.id = Int16(id)
            newNote.title = title
            newNote.detail = detail
            newNote.date = date
        }
        persistenceManager.save()
    }
    
    // MARK: - Get all
    internal func allNotes() -> [NoteEntity] {
        let notes = persistenceManager.fetch(NoteEntity.self)
        return notes
    }
    
    // MARK: - Get by
    internal func getNote(id: Int) -> NoteEntity? {
        let notes = persistenceManager.fetch(NoteEntity.self, predicateKey: "id", predicateValue: String(id))
        return notes.first
    }
    
    // MARK: - Remove by
    internal func removeNote(id: Int) {
        let notes = persistenceManager.fetch(NoteEntity.self, predicateKey: "id", predicateValue: String(id))
        
        guard let note = notes.first else { return }
        persistenceManager.delete(note)
        persistenceManager.save()
    }
    
}

