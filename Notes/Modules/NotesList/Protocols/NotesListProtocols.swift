//
//  NotesListProtocols.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

protocol NotesListViewProtocol: AnyObject {
    
    var presenter: NotesListPresenterProtocol? { get set }
    
    func showNotes(_ notes: [Note])
    func showErrorMessage(_ message: String)
}

protocol NotesListPresenterProtocol: AnyObject {
    
    var view: NotesListViewProtocol? { get set }
    var interactor: NotesListInteractorInputProtocol?{ get set }
    var router: NotesListRouterProtocol? { get set }
    
    func viewWillAppear()
    func showNotesDetail(_ note: Note)
    func addNote(_ note: Note)
    func removeNote(_ note: Note)
}

protocol NotesListInteractorInputProtocol: AnyObject {
    
    var presenter: NotesListInteractorOutputProtocol? { get set }
    
    func retrieveNotes()
    func saveNote(_ note: Note)
    func deleteNote(_ note: Note)
}

protocol NotesListInteractorOutputProtocol: AnyObject {
    
    func didAddNote(_ note: Note)
    func didRemoveNote(_ note: Note)
    func didRetrieveNotes(_ notes: [Note])
    func onError(message: String)
}

protocol NotesListRouterProtocol: AnyObject {
    
    static func createNotesListModule() -> UIViewController
    
    func presentNotesDetailScreen(from view: NotesListViewProtocol, for note: Note?)
}
