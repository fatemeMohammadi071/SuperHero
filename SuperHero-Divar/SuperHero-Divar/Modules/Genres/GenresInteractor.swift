//
//  GenresInteractor.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GenresBusinessLogic {
    func fetchGenres(request: Genres.Genres.Request)
}

protocol GenresDataStore {
    var characterId: Int? { get set }
    var type: SuperHeroInfoDetailType? { get set }
}

class GenresInteractor: GenresDataStore {
    // MARK: - Object lifecycle
    init() {
        GenresLogger.logInit(owner: String(describing: GenresInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresInteractor.self))
    }
    
    // MARK: - Properties
    var characterId: Int?
    var type: SuperHeroInfoDetailType?
    
    // MARK: Public
    var presenter: GenresPresentationLogic?
    var worker: GenresWorkerLogic?
}

// MARK: - Methods

// MARK: Private
private extension GenresInteractor {
    func getComics(characterId: Int) {
        defer { presenter?.hideLoading(response: Genres.Loading.Response()) }
        presenter?.presentLoading(response: Genres.Loading.Response())
        worker?.getComics(characterId: characterId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let comics):
                guard let comics = comics, !comics.isEmpty else {
                    self.presenter?.presentEmptyList(response: Genres.EmptyList.Response(type: "Comics"))
                    return
                }
                self.presenter?.presentComics(response: Genres.Comics.Response(comics: comics))
            case .failure(let erro):
                self.presenter?.presentError(response: Genres.ErrorModel.Response(requestError: erro))
            }
        }
    }
    
    func getEvents(characterId: Int) {
        defer { presenter?.hideLoading(response: Genres.Loading.Response()) }
        presenter?.presentLoading(response: Genres.Loading.Response())
        worker?.getEvents(characterId: characterId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let events):
                guard let events = events, !events.isEmpty else {
                    self.presenter?.presentEmptyList(response: Genres.EmptyList.Response(type: "Events"))
                    return
                }
                self.presenter?.presentEvents(response: Genres.Events.Response(events: events))
            case .failure(let erro):
                self.presenter?.presentError(response: Genres.ErrorModel.Response(requestError: erro))
            }
        }
    }
    
    func getStories(characterId: Int) {
        defer { presenter?.hideLoading(response: Genres.Loading.Response()) }
        presenter?.presentLoading(response: Genres.Loading.Response())
        worker?.getStroies(characterId: characterId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let stories):
                guard let stories = stories, !stories.isEmpty else {
                    self.presenter?.presentEmptyList(response: Genres.EmptyList.Response(type: "Stroies"))
                    return
                }
                self.presenter?.presentStories(response: Genres.Stories.Response(stories: stories))
            case .failure(let erro):
                self.presenter?.presentError(response: Genres.ErrorModel.Response(requestError: erro))
            }
        }
    }
    
    func getSeries(characterId: Int) {
        defer { presenter?.hideLoading(response: Genres.Loading.Response()) }
        presenter?.presentLoading(response: Genres.Loading.Response())
        worker?.getSeries(characterId: characterId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let series):
                guard let series = series, !series.isEmpty else {
                    self.presenter?.presentEmptyList(response: Genres.EmptyList.Response(type: "Series"))
                    return
                }
                self.presenter?.presentSeries(response: Genres.Series.Response(series: series))
            case .failure(let erro):
                self.presenter?.presentError(response: Genres.ErrorModel.Response(requestError: erro))
            }
        }
    }
}

// MARK: Public
extension GenresInteractor {}

// MARK: - Business Logics
extension GenresInteractor: GenresBusinessLogic {
    func fetchGenres(request: Genres.Genres.Request) {
        guard let characterId = characterId else { return }
        switch type {
        case .comics:
            getComics(characterId: characterId)
        case .events:
            getEvents(characterId: characterId)
        case .stories:
            getStories(characterId: characterId)
        case .series:
            getSeries(characterId: characterId)
        case .none:
            break
        }
        
    }
    
    
}
