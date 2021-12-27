//
//  SeriesTableCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

import Foundation

class SeriesTableCellViewModel: DefaultCellViewModel {
    
    init(model: SeriesDetail) {
        super.init(nibName: "SeriesTableViewCell", reuseId: "SeriesTableViewCell", model: model)
    }
}
