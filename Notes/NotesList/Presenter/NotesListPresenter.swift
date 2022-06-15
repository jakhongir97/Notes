//
//  NotesListPresenter.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesListPresenter: NotesListPresenterProtocol {
    
    weak var view: NotesListViewProtocol?
    var interactor: NotesListInteractorInputProtocol?
    var router: NotesListRouterProtocol?
    
    func showNotesDetail(_ note: Note) {
        guard let view = view else { return }
        router?.presentNotesDetailScreen(from: view, for: note)
    }
    
    func addNote(_ note: Note) {
        interactor?.saveNote(note)
    }
    
    func viewWillAppear() {
        interactor?.retrieveNotes()
    }
    
    func removeNote(_ note: Note) {
        interactor?.deleteNote(note)
    }
}

extension NotesListPresenter: NotesListInteractorOutputProtocol {
    
    func didAddNote(_ note: Note) {
        interactor?.retrieveNotes()
    }
    
    func didRemoveNote(_ note: Note) {
        interactor?.retrieveNotes()
    }
    
    func didRetrieveNotes(_ notes: [Note]) {
        view?.showNotes(notes)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
}
