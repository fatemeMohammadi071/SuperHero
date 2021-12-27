//
//  GenresService.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class GenresService {
    // MARK: - Object lifecycle
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        GenresLogger.logInit(owner: String(describing: GenresService.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresService.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let networkManager: NetworkManagerProtocol
}

// MARK: - Methods

// MARK: Public
extension GenresService {
    func getComics(characterId: Int, completion: @escaping (Result<[ComicDetail]?, Error>) -> Void) {
        networkManager.request(GenresEndpoint.getComics(characterId: characterId)) { (date) in
            let interactor = Interactor<ResponseModel<ComicDetail>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
    
    func getEvents(characterId: Int, completion: @escaping (Result<[EventDetail]?, Error>) -> Void) {
        networkManager.request(GenresEndpoint.getEvents(characterId: characterId)) { (date) in
            let interactor = Interactor<ResponseModel<EventDetail>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
    
    func getStrories(characterId: Int, completion: @escaping (Result<[StroyDetail]?, Error>) -> Void) {
        networkManager.request(GenresEndpoint.getStories(characterId: characterId)) { (date) in
            let interactor = Interactor<ResponseModel<StroyDetail>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
    
    func getSeries(characterId: Int, completion: @escaping (Result<[SeriesDetail]?, Error>) -> Void) {
        networkManager.request(GenresEndpoint.getSeries(characterId: characterId)) { (date) in
            let interactor = Interactor<ResponseModel<SeriesDetail>>()
            guard let model = interactor.parse(data: date) else { return }
            completion(.success(model.data?.results))
        } onFailure: { (error) in
            completion(.failure(error))
        }
    }
}
