//
//  SuperHeroDetailDependencyContainer.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SuperHeroDetailDependencyContainer: DependencyContainer {
    // MARK: - Object lifecycle
    override init() {
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailDependencyContainer.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailDependencyContainer.self))
    }
}

// MARK: - Factory
extension SuperHeroDetailDependencyContainer: SuperHeroDetailFactory {
    func makeSuperHeroDetailViewController(superHeroInfo: SuperHeroInfo) -> SuperHeroDetailViewController {
        let vc = SuperHeroDetailViewController(factory: self)
        vc.router?.dataStore?.superHeroInfo = superHeroInfo
        return vc
    }
    
    func makeSuperHeroDetailService() -> SuperHeroDetailService {
        return SuperHeroDetailService(networkManager: networkManager)
    }
}
