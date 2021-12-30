//
//  SuperHeroDetailPresenter.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHeroDetailPresentationLogic {
    func presentSuperHeroDetail(response: SuperHeroDetail.SuperHeroDetail.Response)
}

class SuperHeroDetailPresenter {
    // MARK: - Object lifecycle
    init() {
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SuperHeroDetailDisplayLogic?
}

// MARK: - Methods

// MARK: Private
private extension SuperHeroDetailPresenter {
    func createSectionViewModels(_ cells: [CellViewModel]) -> SectionViewModel {
        let section = DefaultSection.init(cells: cells)
        return section
    }
    
    func createSuperHeroInfoDetailCellViewModels(_ superHerosInfoDetail: [SuperHeroInfoDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { SuperHeroDetailCellViewModel(model: $0)}
        models.forEach { $0.setDelegate(self.viewController) }
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
    
    func createSuperHeroInfoDescriptionCellViewModels(_ superHerosInfoDetail: SuperHeroInfo) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = SuperHeroDescriptionCellViewModel(model: superHerosInfoDetail)
        cellViewModels.append(models)
        
        return cellViewModels
    }
    
    private func generateDetailInfo(superHeroInfo: SuperHeroInfo) -> [SuperHeroInfoDetail] {
        guard let characterId = superHeroInfo.id else { return [] }
        var superHeroInfoDetails : [SuperHeroInfoDetail] = []
        
        let superHeroInfoComics = SuperHeroInfoDetail(name: .comics, characterId: characterId, count: superHeroInfo.comics?.returned ?? 0)
        superHeroInfoDetails.append(superHeroInfoComics)
        
        let superHeroInfoSeries = SuperHeroInfoDetail(name: .series, characterId: characterId, count: superHeroInfo.series?.returned ?? 0)
        superHeroInfoDetails.append(superHeroInfoSeries)
        
        let superHeroInfoStroies = SuperHeroInfoDetail(name: .stories, characterId: characterId, count: superHeroInfo.stories?.returned ?? 0)
        superHeroInfoDetails.append(superHeroInfoStroies)
        
        let superHeroInfoEvents = SuperHeroInfoDetail(name: .events, characterId: characterId, count: superHeroInfo.events?.returned ?? 0)
        superHeroInfoDetails.append(superHeroInfoEvents)
        
        return superHeroInfoDetails
    }
}

// MARK: Public
extension SuperHeroDetailPresenter {}

// MARK: - Presentation Logic
extension SuperHeroDetailPresenter: SuperHeroDetailPresentationLogic {
    func presentSuperHeroDetail(response: SuperHeroDetail.SuperHeroDetail.Response) {
        guard let superHeroInfo = response.superHeroInfo else { return }
        let superHeroDetailCells = createSuperHeroInfoDetailCellViewModels(generateDetailInfo(superHeroInfo: superHeroInfo))
        let superHeroDescriptionCells = createSuperHeroInfoDescriptionCellViewModels(superHeroInfo)
        let section = [createSectionViewModels(superHeroDescriptionCells),
                       createSectionViewModels(superHeroDetailCells)]
        let viewModel = SuperHeroDetail.SuperHeroDetail.ViewModel(sections: section)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displaySuperHeroDetail(viewModel: viewModel)
        }
        
    }
}
