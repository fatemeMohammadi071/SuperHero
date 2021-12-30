//
//  EventTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: EventDetail?
    private var viewModel: EventTableCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

}
// MARK: - Binder
extension EventTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? EventTableCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? EventDetail else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension EventTableViewCell {
    private func setupViews(model: EventDetail) {
        self.setupTitleLabel(text: model.title ?? "")
        self.setupDescriptionLabel(text: model.resultDescription ?? "")
    }
    
    func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBlack)
    }
    
    func setupDescriptionLabel(text: String) {
        self.descriptionLabel.text = text
        self.descriptionLabel.font = UIFont(type: .montserratLight)
    }
}
