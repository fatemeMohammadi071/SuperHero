//
//  SuperHeroDescriptionCellViewModel.swift
//  SuperHero-Divar
//
//  Created by Fateme on 10/9/1400 AP.
//

import Foundation

class SuperHeroDescriptionCellViewModel: DefaultCellViewModel {
    
    init(model: SuperHeroInfo) {
        super.init(nibName: "SuperHeroDescriptionTableViewCell", reuseId: "SuperHeroDescriptionTableViewCell", model: model)
    }
}
