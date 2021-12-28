//
//  SuperHeroDetailCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//

import Foundation

protocol SuperHeroDetailCellViewModelDelegate: AnyObject {
    func cellTapped(characterId: Int?, type: GenresType)
}

class SuperHeroDetailCellViewModel: DefaultCellViewModel {
    weak var delegate: SuperHeroDetailCellViewModelDelegate?
    
    init(model: SuperHeroInfoDetail) {
        super.init(nibName: "SuperHeroDetailTableViewCell", reuseId: "SuperHeroDetailTableViewCell", model: model)
    }
    
    func setDelegate(_ delegate: SuperHeroDetailCellViewModelDelegate?) {
        self.delegate = delegate
    }
}
