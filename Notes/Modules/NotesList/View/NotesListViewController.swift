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
            view().countLabel.text = "\(notes.count) notes"
        }
    }
    
    // MARK: - Actions
    @objc func addAction(sender: UIBarButtonItem) {
        showAlertWithTextField(title: "New Note", message: "Add title and detail", firstPlaceholder: "Title", secondPlaceholder: "Detail") { [weak self] textFrist, textLast in
            let note = Note(id: self?.notes.count ?? 0, title: textFrist, detail: textLast, date: .now)
            self?.presenter?.addNote(note)
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        setupToolBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

// MARK: - Other funcs
extension NotesListViewController {
    private func appearanceSettings() {
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupToolBar() {
        navigationController?.setToolbarHidden(false, animated: false)
        let title =  UIBarButtonItem(customView: view().countLabel)
        let add = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(addAction(sender:)))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [spacer, title, spacer, add]
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let note = notes[indexPath.row]
        presenter?.removeNote(note)
    }
}

// MARK: - UITableViewDelegate
extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        presenter?.showNotesDetail(note)
    }
}
