//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesDetailViewController: UIViewController, ViewSpecificController {
    // MARK: - Root View
    typealias RootView = NotesDetailView
    
    // MARK: - Interface
    var presenter: NotesDetailPresenterProtocol?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - NotesDetailViewProtocol
extension NotesDetailViewController: NotesDetailViewProtocol {
    
    func showNote(_ note: Note) {
        view().titleTextField.text = note.title
        view().detailTextField.text = note.detail
    }
}
