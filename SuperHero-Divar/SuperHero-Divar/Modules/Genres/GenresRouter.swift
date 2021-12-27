//
//  GenresRouter.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol GenresRoutingLogic {
    //    func navigateToSomewhere()
}

protocol GenresDataPassing {
    var dataStore: GenresDataStore? { get set }
}

class GenresRouter: NSObject, GenresDataPassing {
    // MARK: - Object lifecycle
    override init() {
        GenresLogger.logInit(owner: String(describing: GenresRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: GenresViewController?
    var dataStore: GenresDataStore?
}

// MARK: - Methods

// MARK: Private
private extension GenresRouter {}

// MARK: Public
extension GenresRouter {}

// MARK: - Routin Logic
extension GenresRouter: GenresRoutingLogic {
    // MARK: Navigation
}
