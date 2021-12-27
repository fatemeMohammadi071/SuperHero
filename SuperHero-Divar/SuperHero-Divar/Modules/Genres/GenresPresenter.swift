//
//  GenresPresenter.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GenresPresentationLogic {
    func presentComics(response: Genres.Comics.Response)
    func presentEvents(response: Genres.Events.Response)
    func presentStories(response: Genres.Stories.Response)
    func presentSeries(response: Genres.Series.Response)
    func presentLoading(response: Genres.Loading.Response)
    func presentError(response: Genres.ErrorModel.Response)
    func hideLoading(response: Genres.Loading.Response)
}

class GenresPresenter {
    // MARK: - Object lifecycle
    init() {
        GenresLogger.logInit(owner: String(describing: GenresPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: GenresDisplayLogic?
}

// MARK: - Methods

// MARK: Private
private extension GenresPresenter {
    func createSectionViewModels(_ cells: [CellViewModel]) -> SectionViewModel {
        let section = DefaultSection.init(cells: cells)
        return section
    }
    
    func createComicsCellViewModels(_ superHerosInfoDetail: [ComicDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { ComicTableCellViewModel(model: $0)}
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
    
    func createEventsCellViewModels(_ superHerosInfoDetail: [EventDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { EventTableCellViewModel(model: $0)}
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
    
    func createStoriesCellViewModels(_ superHerosInfoDetail: [StroyDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { StroiesTableCellViewModel(model: $0)}
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
    
    func createSeriesCellViewModels(_ superHerosInfoDetail: [SeriesDetail]) -> [CellViewModel] {
        var cellViewModels: [CellViewModel] = []
                
        let models = superHerosInfoDetail.map { SeriesTableCellViewModel(model: $0)}
        
        cellViewModels.append(contentsOf: models)
        
        return cellViewModels
    }
}

// MARK: Public
extension GenresPresenter {}

// MARK: - Presentation Logic
extension GenresPresenter: GenresPresentationLogic {
    func presentComics(response: Genres.Comics.Response) {
        guard let comics = response.comics else { return }
        let cells = createComicsCellViewModels(comics)
        let sections = [createSectionViewModels(cells)]
        let viewModel = Genres.Genres.ViewModel(sections: sections)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayGenres(viewModel: viewModel)
        }
    }
    
    func presentEvents(response: Genres.Events.Response) {
        guard let events = response.events else { return }
        let cells = createEventsCellViewModels(events)
        let sections = [createSectionViewModels(cells)]
        let viewModel = Genres.Genres.ViewModel(sections: sections)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayGenres(viewModel: viewModel)
        }
    }
    
    
    func presentStories(response: Genres.Stories.Response) {
        guard let stories = response.stories else { return }
        let cells = createStoriesCellViewModels(stories)
        let sections = [createSectionViewModels(cells)]
        let viewModel = Genres.Genres.ViewModel(sections: sections)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayGenres(viewModel: viewModel)
        }
    }
    
    func presentSeries(response: Genres.Series.Response) {
        guard let series = response.series else { return }
        let cells = createSeriesCellViewModels(series)
        let sections = [createSectionViewModels(cells)]
        let viewModel = Genres.Genres.ViewModel(sections: sections)
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayGenres(viewModel: viewModel)
        }
    }
    
    func presentLoading(response: Genres.Loading.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayLoading(viewModel: Genres.Loading.ViewModel())
        }
    }
    
    func presentError(response: Genres.ErrorModel.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.displayError(viewModel: Genres.ErrorModel.ViewModel(requestError: response.requestError))
        }
    }
    
    func hideLoading(response: Genres.Loading.Response) {
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            self.viewController?.hideLoading(viewModel: Genres.Loading.ViewModel())}
    }
}
