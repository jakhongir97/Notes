//
//  AlertViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

protocol AlertViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())?)
}

extension AlertViewController where Self: UIViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { (action) in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
