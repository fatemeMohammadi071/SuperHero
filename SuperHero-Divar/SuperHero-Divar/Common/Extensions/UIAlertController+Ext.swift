//
//  UIAlertController+Ext.swift
//  SuperHero
//
//  Created by Fateme on 10/3/1400 AP.
//

import Foundation
import UIKit

extension UIAlertController {
    private static var style: UIStatusBarStyle = .default
    
    func setStyle(style: UIStatusBarStyle) {
        UIAlertController.style = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return UIAlertController.style
    }
}
