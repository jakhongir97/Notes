//
//  CustomView.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

class CustomView: UIView {

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundColor()
    }
    
    // MARK: - UI Setup
    func setupBackgroundColor() {
        backgroundColor = UIColor.appColor(.background)
    }
    
}
