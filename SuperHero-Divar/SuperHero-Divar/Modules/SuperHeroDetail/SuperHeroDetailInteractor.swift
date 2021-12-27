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
private extension SuperHeroDetailInteractor {
    // FIXME: Fateme write it better
    private func generateDetailInfo(superHeroInfo: SuperHeroInfo?) -> [SuperHeroInfoDetail] {
        guard let superHeroInfo = superHeroInfo, let characterId = superHeroInfo.id else { return [] }
        var superHeroInfoDetails : [SuperHeroInfoDetail] = []
        if let comicsReturned = superHeroInfo.comics?.returned, comicsReturned != 0 {
            let superHeroInfoDetail = SuperHeroInfoDetail(name: .comics, count: comicsReturned, characterId: characterId)
            superHeroInfoDetails.append(superHeroInfoDetail)
        }
        if let seriesReturned = superHeroInfo.series?.returned, seriesReturned != 0 {
            let superHeroInfoDetail = SuperHeroInfoDetail(name: .series, count: seriesReturned, characterId: characterId)
            superHeroInfoDetails.append(superHeroInfoDetail)
        }
        if let storiesReturned = superHeroInfo.stories?.returned, storiesReturned != 0 {
            let superHeroInfoDetail = SuperHeroInfoDetail(name: .stories, count: storiesReturned, characterId: characterId)
            superHeroInfoDetails.append(superHeroInfoDetail)
        }
        if let eventsReturned = superHeroInfo.events?.returned, eventsReturned != 0 {
            let superHeroInfoDetail = SuperHeroInfoDetail(name: .events, count: eventsReturned, characterId: characterId)
            superHeroInfoDetails.append(superHeroInfoDetail)
        }
        return superHeroInfoDetails
        
    }
}

// MARK: Public
extension SuperHeroDetailInteractor {}

// MARK: - Business Logics
extension SuperHeroDetailInteractor: SuperHeroDetailBusinessLogic {
    func ShowDetail(request: SuperHeroDetail.SuperHeroDetail.Request) {
        let superHeroInfoDetails = generateDetailInfo(superHeroInfo: superHeroInfo)
        presenter?.presentSuperHeroDetail(response: SuperHeroDetail.SuperHeroDetail.Response(superHeroDetail: superHeroInfoDetails, superHeroName: superHeroInfo?.name, isFavorite: superHeroInfo?.isFavorite ?? false))
        
    }
}
