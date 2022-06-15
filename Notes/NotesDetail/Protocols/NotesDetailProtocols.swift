//
//  NotesDetailProtocols.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

protocol NotesDetailViewProtocol: AnyObject {
    
    var presenter: NotesDetailPresenterProtocol? { get set }
    
    func showNote(_ note: Note)
}

protocol NotesDetailPresenterProtocol: AnyObject {
    
    var view: NotesDetailViewProtocol? { get set }
    var interactor: NotesDetailInteractorInputProtocol? { get set }
    var router: NotesDetailRouterProtocol? { get set }
    
    func viewDidLoad()
    func editNote(title: String?, detail: String?)
    func deleteNote()
}

protocol NotesDetailInteractorInputProtocol: AnyObject {
    
    var presenter: NotesDetailInteractorOutputProtocol? { get set }
    var note: Note? { get set }
    
    func deleteNote()
    func editNote(title: String?, detail: String?)
}

protocol NotesDetailInteractorOutputProtocol: AnyObject {
    
    func didDeleteNote()
    func didEditNote(_ note: Note)
}

protocol NotesDetailRouterProtocol: AnyObject {
    
    static func createNotesDetailRouterModule(with note: Note) -> UIViewController
    
    func navigationBackToNotesListViewController(from view: NotesDetailViewProtocol)
}
