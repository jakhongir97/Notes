//
//  NotesDetailPresenter.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesDetailPresenter: NotesDetailPresenterProtocol {
    
    weak var view: NotesDetailViewProtocol?
    var router: NotesDetailRouterProtocol?
    var interactor: NotesDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        guard let note = interactor?.note else { return }
        view?.showNote(note)
    }
    
    func editNote(title: String?, detail: String?) {
        interactor?.editNote(title: title, detail: detail)
    }
    
    func deleteNote() {
        interactor?.deleteNote()
    }
}

extension NotesDetailPresenter: NotesDetailInteractorOutputProtocol {
    
    func didDeleteNote() {
        guard let view = view else { return }
        router?.navigationBackToNotesListViewController(from: view)
    }
    
    func didEditNote(_ note: Note) {
        view?.showNote(note)
    }
}
