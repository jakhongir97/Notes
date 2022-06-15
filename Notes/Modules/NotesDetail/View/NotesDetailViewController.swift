//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    var presenter: NotesDetailPresenterProtocol?
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension NotesDetailViewController: NotesDetailViewProtocol {
    
    func showNote(_ note: Note) {
        self.note = note
    }
}
