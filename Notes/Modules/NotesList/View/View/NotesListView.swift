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
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
}
