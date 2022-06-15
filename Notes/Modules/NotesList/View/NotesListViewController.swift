//
//  NotesListViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class NotesListViewController: UIViewController, ViewSpecificController, AlertViewController {
    // MARK: - Root View
    typealias RootView = NotesListView
    
    // MARK: - Interface
    var presenter: NotesListPresenterProtocol?
    
    // MARK: - Attributes
    var notes = [Note]() {
        didSet {
            view().tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

// MARK: - NotesListViewProtocol
extension NotesListViewController: NotesListViewProtocol {
    func showNotes(_ notes: [Note]) {
        self.notes = notes
    }
    
    func showErrorMessage(_ message: String) {
        showAlert(title: "Error", message: message)
    }
}

// MARK: - UITableViewDataSource
extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotesListTableViewCell.defaultReuseIdentifier, for: indexPath) as? NotesListTableViewCell else { return UITableViewCell()}
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.detailLabel.text = note.detail
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        presenter?.showNotesDetail(note)
    }
}
