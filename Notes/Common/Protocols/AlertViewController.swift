//
//  AlertViewController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

protocol AlertViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())?)
    func showAlertWithTextField(title: String, message: String, firstPlaceholder: String, secondPlaceholder: String, buttonAction: ((_ textFrist: String?, _ textLast: String?) -> Void)?)
}

extension AlertViewController where Self: UIViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTextField(title: String, message: String, firstPlaceholder: String, secondPlaceholder: String, buttonAction: ((_ textFrist: String?, _ textLast: String?) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = firstPlaceholder
        }
        alert.addTextField { (textField) in
            textField.placeholder = secondPlaceholder
        }
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (action) in
            guard let textFieldFirst =  alert.textFields?.first else {
                buttonAction?(nil, nil)
                return
            }
            guard let textFieldLast =  alert.textFields?.last else {
                buttonAction?(textFieldFirst.text, nil)
                return
            }
            buttonAction?(textFieldFirst.text, textFieldLast.text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
