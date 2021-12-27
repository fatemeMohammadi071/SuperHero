//
//  UIView+Ext.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import UIKit

extension UIView: NibLoadableView {}

extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.addCornerRadius(radius)
    }
}

extension UIView: ViewStateManagerView {
    internal static var _userInteractionOnLoading: Bool = true
}
