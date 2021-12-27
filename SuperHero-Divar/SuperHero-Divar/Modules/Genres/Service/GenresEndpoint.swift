//
//  GenresEndpoint.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

enum GenresEndpoint {
    case getComics(characterId: Int)
    case getEvents(characterId: Int)
    case getStories(characterId: Int)
    case getSeries(characterId: Int)
}

extension GenresEndpoint: RequestProtocol {
    
    public var limit: Int {
        switch self {
        case .getComics, .getEvents, .getStories, .getSeries:
            return 3
        }
    }
    
    public var relativePath: String {
        switch self {
        case .getComics(let characterId):
            return "/public/characters/\(characterId)/comics"
        case .getEvents(let characterId):
            return "/public/characters/\(characterId)/events"
        case .getStories(let characterId):
            return "/public/characters/\(characterId)/stories"
        case .getSeries(let characterId):
            return "/public/characters/\(characterId)/series"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getComics, .getEvents, .getStories, .getSeries: return .get
        }
    }
    
    public var requestType: RequestType {
        switch self {
        case .getComics, .getEvents, .getStories, .getSeries:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var authorizationType: AuthType {
        return .bearer
    }
}
