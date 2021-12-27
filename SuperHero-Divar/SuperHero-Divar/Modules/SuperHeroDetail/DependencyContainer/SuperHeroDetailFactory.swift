//
//  SuperHeroDetailFactory.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias SuperHeroDetailFactory = SuperHeroDetailViewControllerFactory & SuperHeroDetailServiceFactory

protocol SuperHeroDetailViewControllerFactory {
    func makeSuperHeroDetailViewController(superHeroInfo: SuperHeroInfo) -> SuperHeroDetailViewController
}

protocol SuperHeroDetailServiceFactory {
    func makeSuperHeroDetailService() -> SuperHeroDetailService
}
