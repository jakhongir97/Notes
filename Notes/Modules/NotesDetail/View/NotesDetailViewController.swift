//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesDetailViewController: UIViewController, ViewSpecificController, AlertViewController {
    // MARK: - Root View
    typealias RootView = NotesDetailView
    
    // MARK: - Interface
    var presenter: NotesDetailPresenterProtocol?
    
    @objc func editAction(sender: UITextField) {
        let title = view().titleTextField.text
        let detail = view().detailTextField.text
        presenter?.editNote(title: title, detail: detail)
    }
    
    @objc func removeAction(sender: UIBarButtonItem) {
        showAlertDestructive(title: "Warning", message: "Do you really want to remove the note") { [weak self] in
            self?.presenter?.deleteNote()
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTextFields()
        presenter?.viewDidLoad()
    }
}

// MARK: - Other funcs
extension NotesDetailViewController {
    private func setupNavBar() {
        let remove = UIBarButtonItem(image: UIImage(systemName: "trash.circle.fill"), style: .plain, target: self, action: #selector(removeAction(sender:)))
        remove.tintColor = .red
        navigationItem.rightBarButtonItem = remove
    }
    
    private func setupTextFields() {
        view().titleTextField.addTarget(self, action: #selector(editAction(sender:)), for: .editingChanged)
        view().detailTextField.addTarget(self, action: #selector(editAction(sender:)), for: .editingChanged)
    }
}

// MARK: - NotesDetailViewProtocol
extension NotesDetailViewController: NotesDetailViewProtocol {
    func showNote(_ note: Note) {
        view().titleTextField.text = note.title
        view().detailTextField.text = note.detail
    }
}
