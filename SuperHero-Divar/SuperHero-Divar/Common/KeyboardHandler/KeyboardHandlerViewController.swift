//
//  SeriesTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

import UIKit

class KeyboardHandlerViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: Private
    /// Tap gesture recognizer to use for keyboard dismissing
    private lazy var keyboardTapGestureRecognizer: UITapGestureRecognizer = {
        let tempTapGesture = UITapGestureRecognizer(target: UIApplication.shared.keyWindow,
                                                    action: #selector(UIApplication.shared.keyWindow?.endEditing(_:)))
        tempTapGesture.cancelsTouchesInView = false
        tempTapGesture.delegate = self
        return tempTapGesture
    }()
    
    /// Whether notifications are observed or not
    private var areNotificationsObserved = false
    
    // MARK: Public
    var acceptKeyboardNotifications = true
    var hideKeyboardOnViewTapped = true
    
    deinit {
        removeNotifications()
    }
}

// MARK: Life Cycle
extension KeyboardHandlerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        observeNotifications()
        addViewGesture()
    }
}

// ===============
// MARK: - Methods
// ===============

// MARK: Private
private extension KeyboardHandlerViewController {
    func addViewGesture() {
        // Add tap gesture recognizer
        
        guard hideKeyboardOnViewTapped else { return }
        self.view.addGestureRecognizer(keyboardTapGestureRecognizer)
    }
    
    @objc func handleNotifications(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        guard let keyboardInfo = KeyboardInfo(userInfo: userInfo) else { return }
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            UIView.animate(withDuration: keyboardInfo.animationDuration,
                           delay: 0.0,
                           options: keyboardInfo.animationOptions,
                           animations: {
                            self.additionalSafeAreaInsets.bottom = keyboardInfo.frameEnd.height - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
                            self.view.layoutSubviews()
            })
        case UIResponder.keyboardWillHideNotification:
            UIView.animate(withDuration: keyboardInfo.animationDuration,
                           delay: 0.0,
                           options: keyboardInfo.animationOptions,
                           animations: {
                            self.additionalSafeAreaInsets.bottom = 0
                            self.view.layoutSubviews()
            })
        default:
            break
        }
    }
    
    func observeNotifications() {
        guard !areNotificationsObserved, acceptKeyboardNotifications else { return }
        
        [ UIResponder.keyboardWillShowNotification,
          UIResponder.keyboardWillHideNotification]
            .forEach { NotificationCenter.default.addObserver(self, selector: #selector(handleNotifications(_:)), name: $0, object: nil) }
        areNotificationsObserved = true
    }
    
    func removeNotifications() {
        [ UIResponder.keyboardWillShowNotification,
          UIResponder.keyboardWillHideNotification]
            .forEach { NotificationCenter.default.removeObserver(self, name: $0, object: nil) }
    }
}

// MARK: - Gesture Recognizer Delegate
extension KeyboardHandlerViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIControl {
            return false
        }
        return true
    }
}
