//
//  SeriesTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: SeriesDetail?
    private var viewModel: SeriesTableCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

}
// MARK: - Binder
extension SeriesTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? SeriesTableCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? SeriesDetail else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension SeriesTableViewCell {
    private func setupViews(model: SeriesDetail) {
        // TODO: Set text and color
    }
}
