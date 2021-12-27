//
//  SuperHeroDetailWorker.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHeroDetailWorkerLogic {}

class SuperHeroDetailWorker {
    // MARK: - Object lifecycle
    init(service: SuperHeroDetailService) {
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: SuperHeroDetailService
}

// MARK: - Methods

// MARK: Private
private extension SuperHeroDetailWorker {}

// MARK: - Worker Logic
extension SuperHeroDetailWorker: SuperHeroDetailWorkerLogic {}
