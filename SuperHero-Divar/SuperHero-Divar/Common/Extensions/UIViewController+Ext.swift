//
//  UIViewController+Ext.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import UIKit

extension UIViewController: NibLoadable {}

extension UIViewController {
    func presentMessege(title: String?, message: String?, additionalActions: UIAlertAction..., preferredStyle: UIAlertController.Style) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        
        additionalActions.forEach(alertController.addAction)
        alertController.setStyle(style: self.preferredStatusBarStyle)
        alertController.modalPresentationStyle = .currentContext
        present(alertController, animated: true, completion: nil)
    }
    
}
