//
//  SuperHeroCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 10/3/1400 AP.
//

import Foundation

protocol SuperHeroCellViewModelDelegate: AnyObject {
    func cellTapped(model: SuperHeroInfo?)
    func favoriteButtonTapped(id: Int?, isFavorite: Bool)
}

class SuperHeroCellViewModel: DefaultCellViewModel {
    weak var delegate: SuperHeroCellViewModelDelegate?
    
    init(model: SuperHeroInfo) {
        super.init(nibName: "SuperHeroTableViewCell", reuseId: "SuperHeroTableViewCell", model: model)
    }
    
    func setDelegate(_ delegate: SuperHeroCellViewModelDelegate?) {
        self.delegate = delegate
    }
}
