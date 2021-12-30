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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

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
        self.setupTitleLabel(text: model.title ?? "")
        self.setupDescriptionLabel(text: model.resultDescription ?? "")
        self.setupTypeLabel(text: model.type ?? "")
    }
    
    func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBold)
    }
    
    func setupDescriptionLabel(text: String) {
        self.descriptionLabel.text = text
        self.descriptionLabel.font = UIFont(type: .montserratLight)
    }
    
    func setupTypeLabel(text: String) {
        self.typeLabel.text = "Type: " + text
        self.typeLabel.font = UIFont(type: .montserratLight)
    }
}
