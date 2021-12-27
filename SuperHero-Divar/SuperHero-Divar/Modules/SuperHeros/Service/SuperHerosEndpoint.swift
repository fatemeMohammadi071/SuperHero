//
//  SuperHerosEndpoint.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

enum SuperHerosEndpoint {
    case getSuperHeros(offset: Int)
    case serachCharacter(name: String)
}

extension SuperHerosEndpoint: RequestProtocol {
    var limit: Int {
        switch self {
        case .getSuperHeros, .serachCharacter: return 20
        }
    }
    
    var offset: Int {
        switch self {
        case .getSuperHeros(let offset): return offset
        case .serachCharacter: return 0
        }
    }
    
    
    public var relativePath: String {
        switch self {
        case .getSuperHeros: return "/public/characters"
        case .serachCharacter: return "/public/characters"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getSuperHeros, .serachCharacter: return .get
        }
    }
    
    public var requestType: RequestType {
        switch self {
        case .getSuperHeros, .serachCharacter:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthType {
        return .bearer
    }
}
