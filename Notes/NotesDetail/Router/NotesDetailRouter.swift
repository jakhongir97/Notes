//
//  NotesDetailRouter.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesDetailRouter: NotesDetailRouterProtocol {
    
    static func createNotesDetailRouterModule(with note: Note) -> UIViewController {
        let notesDetailViewController = NotesDetailViewController()
        
        let presenter: NotesDetailPresenter & NotesDetailInteractorOutputProtocol = NotesDetailPresenter()
        notesDetailViewController.presenter = presenter
        presenter.view = notesDetailViewController
        
        let interactor: NotesDetailInteractorInputProtocol = NotesDetailInteractor()
        interactor.note = note
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        let router: NotesDetailRouterProtocol = NotesDetailRouter()
        presenter.router = router
        
        return notesDetailViewController
    }
    
    func navigationBackToNotesListViewController(from view: NotesDetailViewProtocol) {
        guard let vc = view as? UIViewController else { return }
        vc.navigationController?.popViewController(animated: true)
    }
}
