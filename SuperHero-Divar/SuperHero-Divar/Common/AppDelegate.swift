//
//  AppDelegate.swift
//  SuperHero-Divar
//
//  Created by Fateme on 10/6/1400 AP.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Prperties
    lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loadFirstViewController()
        
        return true
    }
}

// MARK: Private Methods
extension AppDelegate {
    class func getInstance() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

private extension AppDelegate {
    
    private func getHomeViewController() -> UIViewController {
        let loginDependencyContainer = SuperHerosDependencyContainer()
        return loginDependencyContainer.makeSuperHerosViewController()
    }

    private func loadFirstViewController() {
        setupRootViewController(viewController: getHomeViewController())
    }
    
    private func setupRootViewController(viewController: UIViewController) {
        let rootViewController = UINavigationController(rootViewController: viewController)
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
    }

}
