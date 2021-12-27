//
//  StroiesTableCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import Foundation

class StroiesTableCellViewModel: DefaultCellViewModel {
    
    init(model: StroyDetail) {
        super.init(nibName: "StoriesTableViewCell", reuseId: "StoriesTableViewCell", model: model)
    }
}
