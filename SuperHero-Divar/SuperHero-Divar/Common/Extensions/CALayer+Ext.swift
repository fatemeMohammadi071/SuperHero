//
//  CALayer+Ext.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation
import UIKit

extension CALayer {
    func addCornerRadius(_ value: CGFloat) {
        self.masksToBounds = true
        self.cornerRadius = value
    }

    func addBorder(_ width: CGFloat, color: UIColor) {
        self.borderWidth = width
        self.borderColor = color.cgColor
    }
    
    func removeBorder() {
        self.borderWidth = 0.0
    }
}
