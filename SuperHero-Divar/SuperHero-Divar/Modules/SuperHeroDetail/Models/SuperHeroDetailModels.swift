//
//  SuperHeroDetailModels.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SuperHeroDetail {
    // MARK: Use cases
    
    enum SuperHeroDetail {
        struct Request {
        }
        struct Response {
            var superHeroDetail: [SuperHeroInfoDetail]?
            var superHeroName: String?
            var isFavorite: Bool
        }
        struct ViewModel {
            var sections: [SectionViewModel]?
            var superHeroName: String?
            var isFavorite: Bool
        }
    }
}
