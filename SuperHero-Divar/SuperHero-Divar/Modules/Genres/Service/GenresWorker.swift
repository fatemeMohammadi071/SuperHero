//
//  GenresWorker.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GenresWorkerLogic {
    func getComics(characterId: Int, completion: @escaping (Result<[ComicDetail]?, Error>) -> Void)
    func getEvents(characterId: Int, completion: @escaping (Result<[EventDetail]?, Error>) -> Void)
    func getStroies(characterId: Int, completion: @escaping (Result<[StroyDetail]?, Error>) -> Void)
    func getSeries(characterId: Int, completion: @escaping (Result<[SeriesDetail]?, Error>) -> Void)
}

class GenresWorker {
    // MARK: - Object lifecycle
    init(service: GenresService) {
        GenresLogger.logInit(owner: String(describing: GenresWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: GenresService
}

// MARK: - Methods

// MARK: Private
private extension GenresWorker {}

// MARK: - Worker Logic
extension GenresWorker: GenresWorkerLogic {
    func getComics(characterId: Int, completion: @escaping (Result<[ComicDetail]?, Error>) -> Void) {
        service.getComics(characterId: characterId)  { (result) in
            switch result {
            case .success(let comics):
                completion(.success(comics))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
    
    func getEvents(characterId: Int, completion: @escaping (Result<[EventDetail]?, Error>) -> Void) {
        service.getEvents(characterId: characterId)  { (result) in
            switch result {
            case .success(let events):
                completion(.success(events))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
    
    func getStroies(characterId: Int, completion: @escaping (Result<[StroyDetail]?, Error>) -> Void) {
        service.getStrories(characterId: characterId)  { (result) in
            switch result {
            case .success(let stories):
                completion(.success(stories))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
    
    func getSeries(characterId: Int, completion: @escaping (Result<[SeriesDetail]?, Error>) -> Void) {
        service.getSeries(characterId: characterId)  { (result) in
            switch result {
            case .success(let series):
                completion(.success(series))
            case .failure(let erro):
                completion(.failure(erro))
            }
        }
    }
}
