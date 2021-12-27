//
//  ComicTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 10/5/1400 AP.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: ComicDetail?
    private var viewModel: ComicTableCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

}
// MARK: - Binder
extension ComicTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? ComicTableCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? ComicDetail else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension ComicTableViewCell {
    private func setupViews(model: ComicDetail) {
        // TODO: Set text and color
        typeLabel.text = model.textObjects?.first?.type
        languageLabel.text = model.textObjects?.first?.language
        priceLabel.text = "\(model.prices?.first?.price)"
    }
}
