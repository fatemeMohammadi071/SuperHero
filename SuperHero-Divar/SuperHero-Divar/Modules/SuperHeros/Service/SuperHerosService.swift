//
//  SuperHerosService.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class SuperHerosService {
    // MARK: - Object lifecycle
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosService.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosService.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let networkManager: NetworkManagerProtocol
}

// MARK: - Methods

// MARK: Public
extension SuperHerosService {
    func getSuperHeros(offset: Int, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void) {
        networkManager.request(SuperHerosEndpoint.getSuperHeros(offset: offset)) { (date) in
            let interactor = Interactor<ResponseModel<SuperHeroInfo>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
    
    func searchCharacter(by name: String, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void) {
        networkManager.request(SuperHerosEndpoint.serachCharacter(name: name), extraQueryParams: ["name": name]) { (date) in
            let interactor = Interactor<ResponseModel<SuperHeroInfo>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
}
