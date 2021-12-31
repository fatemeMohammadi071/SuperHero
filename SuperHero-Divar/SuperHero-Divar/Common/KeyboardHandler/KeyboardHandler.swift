//
//  SeriesTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

import UIKit

open class KeyboardHandler: NSObject {
    // ===============
    // MARK: - Outlets
    // ===============
    
    /// Delegate to handle questions
    weak var delegate: KeyboardHandlerDelegate? {
        didSet {
            observeNotifications()
        }
    }
    
    var viewController: UIViewController? {
        didSet {
            setupViewController()
        }
    }
    // ==================
    // MARK: - Properties
    // ==================
    
    /// Whether notifications are observed or not
    private var areNotificationsObserved = false
    
    /// Tap gesture recognizer to use for keyboard dismissing
    private lazy var keyboardTapGestureRecognizer: UITapGestureRecognizer = {
        let tempTapGesture = UITapGestureRecognizer(target: UIApplication.shared.keyWindow,
                                                    action: #selector(UIApplication.shared.keyWindow?.endEditing(_:)))
        tempTapGesture.cancelsTouchesInView = false
        tempTapGesture.delegate = self
        return tempTapGesture
    }()
}
// ===============
// MARK: - Methods
// ===============
private extension KeyboardHandler {
    func setupViewController() {
        // Add tap gesture recognizer
        viewController?.view.addGestureRecognizer(keyboardTapGestureRecognizer)
    }
    
    @objc func handleNotifications(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(userInfo: notification.userInfo) else {
            return
        }
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            _ = delegate?.keyboardHandler?(self, shouldHandleKeyboardWillShowWithInfo: keyboardInfo)
            UIView.animate(withDuration: keyboardInfo.animationDuration,
                           delay: 0.0,
                           options: keyboardInfo.animationOptions,
                           animations: {
                            self.viewController?.additionalSafeAreaInsets.bottom = keyboardInfo.frameEnd.height - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
                            self.viewController?.view.layoutSubviews()
            })
        case UIResponder.keyboardWillHideNotification:
            _ = delegate?.keyboardHandler?(self, shouldHandleKeyboardWillHideWithInfo: keyboardInfo)
            UIView.animate(withDuration: keyboardInfo.animationDuration,
                           delay: 0.0,
                           options: keyboardInfo.animationOptions,
                           animations: {
                            self.viewController?.additionalSafeAreaInsets.bottom = 0
                            self.viewController?.view.layoutSubviews()
            })
        default:
            break
        }
    }
}

// ===================================
// MARK: - Gesture Recognizer Delegate
// ===================================
extension KeyboardHandler: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIControl {
            return false
        }
        return true
    }
}

// =====================
// MARK: - Notifications
// =====================
extension KeyboardHandler {
    func observeNotifications() {
        guard !areNotificationsObserved else { return }
        
        [ UIResponder.keyboardWillShowNotification,
          UIResponder.keyboardDidShowNotification,
          UIResponder.keyboardWillHideNotification,
          UIResponder.keyboardDidHideNotification ]
            .forEach { NotificationCenter.default.addObserver(self, selector: #selector(handleNotifications(_:)), name: $0, object: nil) }
        areNotificationsObserved = true
    }
}
