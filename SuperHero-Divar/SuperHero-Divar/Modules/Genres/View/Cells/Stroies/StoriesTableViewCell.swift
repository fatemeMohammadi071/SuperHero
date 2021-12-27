//
//  StoriesTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: StroyDetail?
    private var viewModel: StroiesTableCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

}
// MARK: - Binder
extension StoriesTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? StroiesTableCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? StroyDetail else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension StoriesTableViewCell {
    private func setupViews(model: StroyDetail) {
        // TODO: Set text and color
    }
}
