//
//  NotesListRouter.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesListRouter: NotesListRouterProtocol {
    
    static func createNotesListModule() -> UIViewController {
        let notesListViewController = NotesListViewController()
        let presenter: NotesListPresenterProtocol & NotesListInteractorOutputProtocol = NotesListPresenter()
        let interactor: NotesListInteractorInputProtocol = NotesListInteractor()
        let router = NotesListRouter()
        
        notesListViewController.presenter = presenter
        presenter.view = notesListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return notesListViewController
    }
    
    func presentNotesDetailScreen(from view: NotesListViewProtocol, for note: Note) {
        
        let notesDetailViewController = NotesDetailRouter.createNotesDetailRouterModule(with: note)
        
        guard let vc = view as? ViewController else { return }
        vc.navigationController?.pushViewController(notesDetailViewController, animated: true)
    }
}

