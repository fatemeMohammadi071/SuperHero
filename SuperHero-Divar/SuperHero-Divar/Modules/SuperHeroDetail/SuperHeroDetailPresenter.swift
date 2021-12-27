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
    
    func createCellViewModels(_ superHerosInfoDetail: [SuperHeroInfoDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { SuperHeroDetailCellViewModel(model: $0)}
        models.forEach { $0.setDelegate(self.viewController) }
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
}

// MARK: Public
extension SuperHeroDetailPresenter {}

// MARK: - Presentation Logic
extension SuperHeroDetailPresenter: SuperHeroDetailPresentationLogic {
    func presentSuperHeroDetail(response: SuperHeroDetail.SuperHeroDetail.Response) {
        guard let superHeros = response.superHeroDetail else { return }
        let cells = createCellViewModels(superHeros)
        let section = [createSectionViewModels(cells)]
        let viewModel = SuperHeroDetail.SuperHeroDetail.ViewModel(sections: section, superHeroName: response.superHeroName, isFavorite: response.isFavorite)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displaySuperHeroDetail(viewModel: viewModel)
        }
        
    }
}
