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
    private var SuperHeroInfos: [SuperHeroInfo] = []

    
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
        defer { presenter?.hideLoading(response: SuperHeros.Loading.Response()) }
        presenter?.presentLoading(response: SuperHeros.Loading.Response())
        worker?.getSuperHeros(offset: request.offset) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let superHerosInfo):
                guard let superHeroInfos: [SuperHeroInfo] = superHerosInfo, !superHeroInfos.isEmpty else {
                    // TODO: Show empty list
                    self.presenter?.presentError(response: SuperHeros.ErrorModel.Response(requestError: SuperHeroErrors.errorNoResult))
                    return
                }
                self.SuperHeroInfos.append(contentsOf: superHeroInfos)
                self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.SuperHeroInfos))
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
        self.presenter?.presentSuperHeros(response: SuperHeros.SuperHeros.Response(superHeros: self.SuperHeroInfos))
    }
}
