//
//  ViewSpecificController.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
