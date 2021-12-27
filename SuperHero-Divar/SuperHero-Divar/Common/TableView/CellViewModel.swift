//
//  CellViewModel.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

protocol CellViewModel {
    var nibName: String {get}
    var reuseId: String {get}
    func getModel() -> Any?
}

protocol Binder {
    func bind(_ viewModel: Any)
}

class DefaultCellViewModel: CellViewModel {
    var nibName: String
    var reuseId: String
    var model: Any?
    
    internal init(nibName: String, reuseId: String, model: Any?) {
        self.nibName = nibName
        self.reuseId = reuseId
        self.model = model
    }
    
    func getModel() -> Any? {
        return model
    }
}
