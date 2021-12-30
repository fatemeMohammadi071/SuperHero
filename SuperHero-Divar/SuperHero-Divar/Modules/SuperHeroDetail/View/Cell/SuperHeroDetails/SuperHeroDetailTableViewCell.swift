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
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var icon: UIImageView!
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
        self.setupTitleLabel(text: model.name.title)
        self.setupCountLabel(text: "\(model.count)")
        self.setupIconImage(type: model.name)
    }
    
    func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBold, fontSize: 15)
    }
    
    func setupCountLabel(text: String) {
        self.countLabel.text = "Count: " + text
        self.countLabel.font = UIFont(type: .montserratLight)
    }
    
    func setupIconImage(type: SuperHeroInfoDetailType) {
        let image: UIImage?
        switch type {
        case .comics:
            image = #imageLiteral(resourceName: "comic")
        case .series:
            image = #imageLiteral(resourceName: "series")
        case .stories:
            image = #imageLiteral(resourceName: "fairy-tale")
        case .events:
            image = #imageLiteral(resourceName: "placard")
        }
        self.icon.image = image
        self.icon.addCornerRadius(15)
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
