//
//  EventTableCellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import Foundation

class EventTableCellViewModel: DefaultCellViewModel {
    
    init(model: EventDetail) {
        super.init(nibName: "EventTableViewCell", reuseId: "EventTableViewCell", model: model)
    }
}
