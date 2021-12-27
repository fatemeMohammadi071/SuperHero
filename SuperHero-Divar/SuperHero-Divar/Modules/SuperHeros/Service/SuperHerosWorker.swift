//
//  SuperHerosWorker.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHerosWorkerLogic {
    func getSuperHeros(offset: Int, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void)
    func searchCharacter(name: String, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void)
}

class SuperHerosWorker {
    // MARK: - Object lifecycle
    init(service: SuperHerosService) {
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: SuperHerosService
}

// MARK: - Methods

// MARK: Private
private extension SuperHerosWorker {}

// MARK: - Worker Logic
extension SuperHerosWorker: SuperHerosWorkerLogic {
    func getSuperHeros(offset: Int, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void) {
        service.getSuperHeros(offset: offset) { (result) in
            switch result {
            case .success(let superHerosInfo):
                completion(.success(superHerosInfo))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
    
    func searchCharacter(name: String, completion: @escaping (Result<[SuperHeroInfo]?, Error>) -> Void) {
        service.searchCharacter(by: name) { (result) in
            switch result {
            case .success(let superHerosInfo):
                completion(.success(superHerosInfo))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
}
