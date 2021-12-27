//
//  GenresDependencyContainer.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class GenresDependencyContainer: DependencyContainer {
    // MARK: - Object lifecycle
    override init() {
        GenresLogger.logInit(owner: String(describing: GenresDependencyContainer.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresDependencyContainer.self))
    }
}

// MARK: - Factory
extension GenresDependencyContainer: GenresFactory {
    func makeGenresViewController(type: GenresType, characterId: Int) -> GenresViewController {
        let vc = GenresViewController(factory: self)
        vc.router?.dataStore?.characterId = characterId
        vc.router?.dataStore?.type = type
        return vc
    }
    
    func makeGenresService() -> GenresService {
        return GenresService(networkManager: networkManager)
    }
}
