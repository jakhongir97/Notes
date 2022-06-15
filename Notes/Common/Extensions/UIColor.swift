//
//  UIColor.swift
//  Notes
//
//  Created by Admin NBU on 15/06/22.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
}
