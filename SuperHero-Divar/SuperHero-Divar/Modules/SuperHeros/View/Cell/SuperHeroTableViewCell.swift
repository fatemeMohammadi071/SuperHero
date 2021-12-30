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
//    @IBOutlet private weak var firstComicsLabel: UILabel!
    @IBOutlet private weak var firstSeriesLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var profileImage: UIImageView!
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
        self.setupTitleLabel(text: model.name ?? "")
        self.setupProfileImage()
//        self.setupFirstComicsLabel(text: model.comics?.items?.first?.name ?? "")
        self.setupfirstSeriesLabel(text: "First Seris: " + (model.series?.items?.first?.name ?? "Nothing"))
        self.setupTapGesture()
    }
    
    private func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBold)
    }
    
    private func setupProfileImage() {
        self.profileImage.addCornerRadius(30)
    }
    
//    private func setupFirstComicsLabel(text: String) {
//        self.firstComicsLabel.text = text
//        self.firstComicsLabel.font = UIFont(type: .montserratLight)
//    }
    
    private func setupfirstSeriesLabel(text: String) {
        self.firstSeriesLabel.text = text
        self.firstSeriesLabel.font = UIFont(type: .montserratMedium)
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
