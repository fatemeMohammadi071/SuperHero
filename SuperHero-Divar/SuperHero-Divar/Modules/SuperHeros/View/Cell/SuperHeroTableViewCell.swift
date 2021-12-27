//
//  SuperHeroTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 10/3/1400 AP.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: SuperHeroInfo?
    private var viewModel: SuperHeroCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
}
// MARK: - Binder
extension SuperHeroTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? SuperHeroCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? SuperHeroInfo else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension SuperHeroTableViewCell {
    private func setupViews(model: SuperHeroInfo) {
        // TODO: Set text and color
        self.titleLabel.text = model.name
        self.descriptionLabel.text = model.modified        
        setupTapGesture()
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.cellTapped))
        self.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Actions
extension SuperHeroTableViewCell {
    @objc private func cellTapped() {
        viewModel?.delegate?.cellTapped(model: model)
    }
    
    @IBAction private func favoriteButtonDidTapped() {
        if model?.isFavorite ?? false {
            model?.isFavorite = false
            favoriteButton.setImage(#imageLiteral(resourceName: "unfavorite"), for: .normal)
        } else {
            model?.isFavorite = true
            favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }
    }
}
