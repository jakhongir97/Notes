//
//  NotesListView.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

final class NotesListView: CustomView {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: NotesListTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: NotesListTableViewCell.defaultReuseIdentifier)
        }
    }
}
