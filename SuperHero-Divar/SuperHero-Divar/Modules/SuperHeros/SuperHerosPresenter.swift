//
//  SuperHerosPresenter.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHerosPresentationLogic {
    func presentSuperHeros(response: SuperHeros.SuperHeros.Response)
    func presentSearchResult(response: SuperHeros.SuperHeros.Response)
    func presentLoading(response: SuperHeros.Loading.Response)
    func presentError(response: SuperHeros.ErrorModel.Response)
    func hideLoading(response: SuperHeros.Loading.Response)
}

class SuperHerosPresenter {
    // MARK: - Object lifecycle
    init() {
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SuperHerosDisplayLogic?
}

// MARK: - Methods

// MARK: Private
private extension SuperHerosPresenter {
    func createSectionViewModels(_ cells: [CellViewModel]) -> SectionViewModel {
        let section = DefaultSection.init(cells: cells)
        return section
    }
    
    func createCellViewModels(_ superHeros: [SuperHeroInfo]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHeros.map { SuperHeroCellViewModel(model: $0)}
        models.forEach { $0.setDelegate(self.viewController) }
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
}

// MARK: Public
extension SuperHerosPresenter {}

// MARK: - Presentation Logic
extension SuperHerosPresenter: SuperHerosPresentationLogic {
    func presentSuperHeros(response: SuperHeros.SuperHeros.Response) {
        guard let superHeros = response.superHeros else { return }
        let cells = createCellViewModels(superHeros)
        let section = [createSectionViewModels(cells)]
        let viewModel = SuperHeros.SuperHeros.ViewModel(sections: section)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displaySuperHeros(viewModel: viewModel)
        }
    }
    
    func presentSearchResult(response: SuperHeros.SuperHeros.Response) {
        guard let superHeros = response.superHeros else { return }
        let cells = createCellViewModels(superHeros)
        let section = [createSectionViewModels(cells)]
        let viewModel = SuperHeros.SuperHeros.ViewModel(sections: section)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displaySearchResult(viewModel: viewModel)
        }
    }
    
    func presentLoading(response: SuperHeros.Loading.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayLoading(viewModel: SuperHeros.Loading.ViewModel())
        }
    }
    
    func presentError(response: SuperHeros.ErrorModel.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayError(viewModel: SuperHeros.ErrorModel.ViewModel(requestError: response.requestError))
        }
    }
    
    func hideLoading(response: SuperHeros.Loading.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.hideLoading(viewModel: SuperHeros.Loading.ViewModel())}
    }
}
