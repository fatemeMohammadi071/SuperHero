//
//  SuperHerosModels.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SuperHeros {
    // MARK: Use cases
    
    enum SuperHeros {
        struct Request {
            var offset: Int
        }
        struct Response {
            var superHeros: [SuperHeroInfo]?
        }
        struct ViewModel {
            var sections: [SectionViewModel]?
        }
    }
    
    enum Search {
        struct Request {
            var name: String
        }
        struct Response {
            var superHeros: [SuperHeroInfo]?
        }
        struct ViewModel {
            var sections: [SectionViewModel]?
        }
    }
    
    enum Loading {
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ErrorModel {
        struct Response {
            var requestError: Error
        }
        struct ViewModel {
            var requestError: Error
        }
    }
}
