//
//  SuperHeroDescriptionTableViewCell.swift
//  SuperHero-Divar
//
//  Created by Fateme on 10/9/1400 AP.
//

import UIKit

class SuperHeroDescriptionTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: SuperHeroInfo?
    private var viewModel: SuperHeroDescriptionCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var favoriteImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

}
// MARK: - Binder
extension SuperHeroDescriptionTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? SuperHeroDescriptionCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? SuperHeroInfo else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension SuperHeroDescriptionTableViewCell {
    private func setupViews(model: SuperHeroInfo) {
        self.setupTitleLabel(text: model.name ?? "")
        self.setupDescriptionLabel(
            text: model.resultDescription ?? "There is no descriptions")
        self.setupFavoriteImage(isFavorite: model.isFavorite ?? false)
    }
    
    private func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBlack, fontSize: 20)
    }
    
    private func setupDescriptionLabel(text: String) {
        self.descriptionLabel.text = text
        self.descriptionLabel.font = UIFont(type: .montserratMedium, fontSize: 15)
    }
    
    private func setupFavoriteImage(isFavorite: Bool) {
        self.favoriteImage.image = isFavorite ? #imageLiteral(resourceName: "favorite") : #imageLiteral(resourceName: "unfavorite")
    }
}
