//
//  SuperHeroDetailRouter.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHeroDetailRoutingLogic {
    func navigateToGenres(type: GenresType, characterId: Int)
}

protocol SuperHeroDetailDataPassing {
    var dataStore: SuperHeroDetailDataStore? { get set }
}

class SuperHeroDetailRouter: NSObject, SuperHeroDetailDataPassing {
    // MARK: - Object lifecycle
    override init() {
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SuperHeroDetailViewController?
    var dataStore: SuperHeroDetailDataStore?
}

// MARK: - Methods

// MARK: Private
private extension SuperHeroDetailRouter {}

// MARK: Public
extension SuperHeroDetailRouter {}

// MARK: - Routin Logic
extension SuperHeroDetailRouter: SuperHeroDetailRoutingLogic {
    func navigateToGenres(type: GenresType, characterId: Int) {
        let genresDependencyContainer = GenresDependencyContainer()
        let genresViewController = genresDependencyContainer.makeGenresViewController(type: type, characterId: characterId)
        viewController?.navigationController?.pushViewController(genresViewController, animated: true)
    }
}
