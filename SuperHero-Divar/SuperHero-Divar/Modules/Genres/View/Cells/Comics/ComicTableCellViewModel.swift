//
//  ComicTableCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 10/5/1400 AP.
//

import Foundation

class ComicTableCellViewModel: DefaultCellViewModel {
    
    init(model: ComicDetail) {
        super.init(nibName: "ComicTableViewCell", reuseId: "ComicTableViewCell", model: model)
    }
}
