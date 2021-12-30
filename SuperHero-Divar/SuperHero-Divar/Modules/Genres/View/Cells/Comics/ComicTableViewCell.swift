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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var comicIcon: UIImageView!

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
        self.setupTitleLabel(text: model.title ?? "")
        self.setupDescriptionLabel(text: model.resultDescription ?? "")
    }
    
    func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBold)
    }
    
    func setupDescriptionLabel(text: String) {
        self.descriptionLabel.text = text
        self.descriptionLabel.font = UIFont(type: .montserratLight)
    }
}
