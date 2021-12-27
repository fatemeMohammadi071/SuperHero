//
//  GenresFactory.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias GenresFactory = GenresViewControllerFactory & GenresServiceFactory

protocol GenresViewControllerFactory {
    func makeGenresViewController(type: GenresType, characterId: Int) -> GenresViewController
}

protocol GenresServiceFactory {
    func makeGenresService() -> GenresService
}
