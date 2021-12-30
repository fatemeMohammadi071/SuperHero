//
//  SuperHeroDetailInteractor.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHeroDetailBusinessLogic {
    func ShowDetail(request: SuperHeroDetail.SuperHeroDetail.Request)
}

protocol SuperHeroDetailDataStore {
    var superHeroInfo: SuperHeroInfo? { get set }
}

class SuperHeroDetailInteractor: SuperHeroDetailDataStore {
    
    // MARK: - Object lifecycle
    init() {
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailInteractor.self))
    }
    
    // MARK: - Properties
    var superHeroInfo: SuperHeroInfo?
    
    // MARK: Public
    var presenter: SuperHeroDetailPresentationLogic?
    var worker: SuperHeroDetailWorkerLogic?
}

// MARK: - Methods

// MARK: Private
private extension SuperHeroDetailInteractor {}

// MARK: Public
extension SuperHeroDetailInteractor {}

// MARK: - Business Logics
extension SuperHeroDetailInteractor: SuperHeroDetailBusinessLogic {
    func ShowDetail(request: SuperHeroDetail.SuperHeroDetail.Request) {
        presenter?.presentSuperHeroDetail(response: SuperHeroDetail.SuperHeroDetail.Response(superHeroInfo: superHeroInfo))
        
    }
}
