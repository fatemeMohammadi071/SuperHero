//
//  SuperHerosDependencyContainer.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SuperHerosDependencyContainer: DependencyContainer {
    // MARK: - Object lifecycle
    override init() {
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosDependencyContainer.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosDependencyContainer.self))
    }
}

// MARK: - Factory
extension SuperHerosDependencyContainer: SuperHerosFactory {
    func makeSuperHerosViewController() -> SuperHerosViewController {
        return SuperHerosViewController(factory: self)
    }
    
    func makeSuperHerosService() -> SuperHerosService {
        return SuperHerosService(networkManager: networkManager)
    }
}
