//
//  SuperHeroDetailService.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class SuperHeroDetailService {
    // MARK: - Object lifecycle
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailService.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailService.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let networkManager: NetworkManagerProtocol
}

// MARK: - Methods

// MARK: Public
extension SuperHeroDetailService {}
