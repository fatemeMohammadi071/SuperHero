//
//  SuperHerosInteractor.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHerosBusinessLogic {
    func fetchSuperHeros(request: SuperHeros.SuperHeros.Request)
    func searchCharacter(request: SuperHeros.Search.Request)
    func reloaViewController(request: SuperHeros.SuperHeros.Request)
    func didSelectFavorite(request: SuperHeros.Favorite.Request)
    func fetchNexSuperHeros(request: SuperHeros.SuperHeros.Request)
}

protocol SuperHerosDataStore {}

class SuperHerosInteractor: SuperHerosDataStore {
    // MARK: - Object lifecycle
    init() {
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosInteractor.self))
    }
    
    // MARK: - Properties
    private let debouncer = Debouncer(timeInterval: 0.5)
    private var superHeroInfos: [SuperHeroInfo] = []
    private var offset: Int = 0

    
    // MARK: Public
    var presenter: SuperHerosPresentationLogic?
    var worker: SuperHerosWorkerLogic?
}

// MARK: - Methods

// MARK: Private
private extension SuperHerosInteractor {}

// MARK: Public
extension SuperHerosInteractor {}

// MARK: - Business Logics
extension SuperHerosInteractor: SuperHerosBusinessLogic {
    func fetchSuperHeros(request: SuperHeros.SuperHeros.Request) {
        presenter?.presentLoading(response: SuperHeros.Loading.Response())
        worker?.getSuperHeros(offset: 0) { [weak self] (result) in
            guard let self = self else { return }
            self.presenter?.hideLoading(response: SuperHeros.Loading.Response())
            switch result {
            case .success(let superHerosInfo):
                guard let superHeroInfos: [SuperHeroInfo] = superHerosInfo, !superHeroInfos.isEmpty else {
                    self.presenter?.presnetEmptyList(response: SuperHeros.EmptyList.Response())
                    return
                }
                self.superHeroInfos.append(contentsOf: superHeroInfos)
                self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.superHeroInfos))
            case .failure(let erro):
                self.presenter?.presentError(response: SuperHeros.ErrorModel.Response(requestError: erro))
            }
        }
    }
    
    func fetchNexSuperHeros(request: SuperHeros.SuperHeros.Request) {
        worker?.getSuperHeros(offset: offset) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let superHerosInfo):
                guard let superHeroInfos: [SuperHeroInfo] = superHerosInfo, !superHeroInfos.isEmpty else { return }
                self.superHeroInfos.append(contentsOf: superHeroInfos)
                self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.superHeroInfos))
                self.offset += 1
            case .failure(let erro):
                self.presenter?.presentError(response: SuperHeros.ErrorModel.Response(requestError: erro))
            }
        }
    }
    
    func searchCharacter(request: SuperHeros.Search.Request) {
        debouncer.renewInterval()
        debouncer.handler = { [weak self] in
            self?.worker?.searchCharacter(name: request.name) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let superHerosInfo):
                    guard let superHeroInfos: [SuperHeroInfo] = superHerosInfo, !superHeroInfos.isEmpty else { return }
                    self.presenter?.presentSearchResult(response: SuperHeros.SuperHeros.Response(superHeros: superHeroInfos))
                case .failure(let error):
                    self.presenter?.presentError(response: SuperHeros.ErrorModel.Response(requestError: error))
                }
            }
        }
    }
    
    func reloaViewController(request: SuperHeros.SuperHeros.Request) {
        self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.superHeroInfos))
    }
    
    func didSelectFavorite(request: SuperHeros.Favorite.Request) {
        var updateModel = self.superHeroInfos.filter { $0.id == request.id }.first
        updateModel?.isFavorite = request.isFavorite
        if let index = self.superHeroInfos.firstIndex(where: { (superInfo) -> Bool in
            superInfo.id == request.id
        }), let updateModel = updateModel  {
            self.superHeroInfos.remove(at: index)
            self.superHeroInfos.insert(updateModel, at: index)
            self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.superHeroInfos))
        }
    }
}
