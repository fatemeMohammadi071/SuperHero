//
//  SuperHeroDetailEndpoint.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

enum SuperHeroDetailEndpoint {
//    case something
}

extension SuperHeroDetailEndpoint: RequestProtocol {
    
    public var relativePath: String {
//        switch self {
//        case .something: return "/"
//        }
        return "/"
    }
    
    public var method: HTTPMethod {
//        switch self {
//        case .something: return .get
//        }
        return .get
    }
    
    public var requestType: RequestType {
//        switch self {
//        case .something:
//            return .requestPlain
//        }
        return .requestPlain
    }
    
    var authorizationType: AuthType {
        return .bearer
    }
}
