//
//  ViewStateManagerView.swift
//  SuperHero
//
//  Created by Fateme on 10/3/1400 AP.
//

import Foundation
import UIKit

protocol ViewStateManagerView {
    func showLoading()
    func hideLoading()
    var frame: CGRect { get }
    static var _userInteractionOnLoading: Bool { get set }
    func use(_ view: UIView)
    func dontUse(viewWithTag tag: Int)
}

final class ViewStateManager {
    private init() {}
}

// MARK: - Loading View
extension ViewStateManager {

    static func presentLoadingView<ViewType: UITableView>(in view: ViewType) {
        view.showLoading()
    }
    
    static func presentLoadingView<ViewType: ViewStateManagerView>(in view: ViewType) {
        view.showLoading()
    }
    
    static func hideLoadingView<ViewType: UITableView>(from view: ViewType) {
        view.hideLoading()
    }
    
    static func hideLoadingView<ViewType: ViewStateManagerView>(from view: ViewType) {
        view.hideLoading()
    }
    
    static func hideLoadingView<ViewType: UIImageView>(from view: ViewType) {
        view.hideLoading()
    }
}
