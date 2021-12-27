//
//  SuperHerosRouter.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHerosRoutingLogic {
    func navigateToSuperHeroDetail(superHeroInfo: SuperHeroInfo)
}

protocol SuperHerosDataPassing {
    var dataStore: SuperHerosDataStore? { get }
}

class SuperHerosRouter: NSObject, SuperHerosDataPassing {
    // MARK: - Object lifecycle
    override init() {
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SuperHerosViewController?
    var dataStore: SuperHerosDataStore?
}

// MARK: - Methods

// MARK: Private
private extension SuperHerosRouter {}

// MARK: Public
extension SuperHerosRouter {}

// MARK: - Routin Logic
extension SuperHerosRouter: SuperHerosRoutingLogic {
    func navigateToSuperHeroDetail(superHeroInfo: SuperHeroInfo) {
//        let superHeroDetailDependencyContainer = SuperHeroDetailDependencyContainer()
//        let superHeroDetailViewController = superHeroDetailDependencyContainer.makeSuperHeroDetailViewController(superHeroInfo: superHeroInfo)
//        viewController?.navigationController?.pushViewController(superHeroDetailViewController, animated: true)
    }
}
