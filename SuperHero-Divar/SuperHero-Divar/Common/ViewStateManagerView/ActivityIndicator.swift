//
//  ActivityIndicator.swift
//  SuperHero
//
//  Created by Fateme on 10/3/1400 AP.
//

import UIKit

extension ViewStateManagerView where Self: UIView {
    func showLoading() {
        self.isUserInteractionEnabled = userInteractionOnLoading
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    var userInteractionOnLoading: Bool {
        get {
            return Self._userInteractionOnLoading
        }
        set {
            Self._userInteractionOnLoading = newValue
        }
    }
    
    func hideLoading() {
        if let loadingView = self.viewWithTag(100) {
            self.userInteractionOnLoading = true
            self.isUserInteractionEnabled = userInteractionOnLoading
            loadingView.removeFromSuperview()
        }
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        layoutIfNeeded()
        
        let view = UIView()
        view.backgroundColor = getColor()
        view.frame = self.bounds
        view.tag = 100
        view.layer.cornerRadius = self.layer.cornerRadius
        
        customizeActivityIndicator(with: activityIndicator,
                                   on: view)
        
        self.addSubview(view)
    }
    
    private func customizeActivityIndicator(with activityIndicator: UIActivityIndicatorView,
                                            on loadingView: UIVisualEffectView) {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = self.getStyle()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.contentView.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: loadingView.contentView.centerXAnchor, constant: 0.0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: loadingView.contentView.centerYAnchor, constant: 0.0).isActive = true
    }
    
    private func customizeActivityIndicator(with activityIndicator: UIActivityIndicatorView,
                                            on loadingView: UIView) {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = self.getStyle()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor, constant: 0.0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor, constant: 0.0).isActive = true
    }
    
    var frame: CGRect {
        layoutIfNeeded()
        return bounds
    }
    
    func use(_ view: UIView) {
        addSubview(view)
    }
    
    func dontUse(viewWithTag tag: Int) {
        guard let view = viewWithTag(tag) else { return }
        view.removeFromSuperview()
    }
    
    func getColor() -> UIColor {
        return .white
    }
    
    func getStyle() -> UIActivityIndicatorView.Style {
        return .medium
    }
}

extension ViewStateManagerView where Self: UITableView {
    func showLoading() {
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        guard backgroundView?.tag == 100 else { return }
        backgroundView = nil
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        layoutIfNeeded()
        
        let view = UIView()
        view.frame = self.bounds
        view.tag = 100
        view.layer.cornerRadius = self.layer.cornerRadius
        view.backgroundColor = getColor()
        customizeActivityIndicator(with: activityIndicator,
                                   on: view)
        
        backgroundView = view
    }
    
    func use(_ view: UIView) {
        backgroundView = view
    }
    
    func dontUse(viewWithTag tag: Int) {
        guard backgroundView?.tag == tag else { return }
        backgroundView = nil
    }
    
}

extension ViewStateManagerView where Self: UICollectionView {
    func showLoading() {
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        backgroundView = nil
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.bounds
        
        visualEffectView.tag = 100
        visualEffectView.layer.cornerRadius = self.layer.cornerRadius
        
        customizeActivityIndicator(with: activityIndicator,
                                   on: visualEffectView)
        
        backgroundView = visualEffectView
    }
    
    func use(_ view: UIView) {
        backgroundView = view
    }
    
    func dontUse(viewWithTag tag: Int) {
        guard backgroundView?.tag == tag else { return }
        backgroundView = nil
    }
    
}

extension ViewStateManagerView where Self: UISwitch {
    func showLoading() {
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        layoutIfNeeded()
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let loadingView = UIVisualEffectView(effect: blurEffect)
        loadingView.frame = CGRect(x: -3.0,
                                   y: -3.0,
                                   width: frame.width + 6.0,
                                   height: frame.height + 6.0)
        
        loadingView.tag = 100
        loadingView.layer.cornerRadius = loadingView.frame.height / 2.0
        loadingView.clipsToBounds = true
        
        customizeActivityIndicator(with: activityIndicator,
                                   on: loadingView)
        
        addSubview(loadingView)
    }
}

extension ViewStateManagerView where Self: UIButton {
    func showLoading() {
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        layoutIfNeeded()
        
        let view = UIView()
        view.backgroundColor = getColor()
        view.frame = self.bounds
        view.tag = 100
        view.layer.cornerRadius = self.layer.cornerRadius
        
        customizeActivityIndicator(with: activityIndicator,
                                   on: view)
        
        self.addSubview(view)
    }
}

extension ViewStateManagerView where Self: UIImageView {
    func showLoading() {
        layoutIfNeeded()
        let activityIndicator = UIActivityIndicatorView.init(style: getStyle())
        createLoadingView(with: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func createLoadingView(with activityIndicator: UIActivityIndicatorView) {
        layoutIfNeeded()
        
        let view = UIView()
        view.backgroundColor = getColor()
        view.frame = self.bounds
        view.tag = 100
        view.layer.cornerRadius = self.layer.cornerRadius
        
        customizeActivityIndicator(with: activityIndicator,
                                   on: view)
        
        self.addSubview(view)
    }
}
