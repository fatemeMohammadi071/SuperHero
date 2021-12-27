//
//  SuperHeroDetailTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//

import UIKit

class SuperHeroDetailTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: SuperHeroInfoDetail?
    private var viewModel: SuperHeroDetailCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
}
// MARK: - Binder
extension SuperHeroDetailTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? SuperHeroDetailCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? SuperHeroInfoDetail else { return }
        self.model = model
        setupViews(model: model)
        setupTapGesture()
    }
}

// MARK: Private
private extension SuperHeroDetailTableViewCell {
    private func setupViews(model: SuperHeroInfoDetail) {
        // TODO: Set text and color
        self.titleLabel.text = model.name.title
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.cellTapped))
        self.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Actions
extension SuperHeroDetailTableViewCell {
    @objc func cellTapped() {
        guard let type = model?.name else { return }
        viewModel?.delegate?.cellTapped(characterId: model?.characterId, type: type)
    }
}
