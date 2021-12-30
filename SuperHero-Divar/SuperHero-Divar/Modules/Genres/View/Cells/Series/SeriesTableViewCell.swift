//
//  SeriesTableViewCell.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: Private
    private var model: SeriesDetail?
    private var viewModel: SeriesTableCellViewModel?
    
    // MARK: = Delegate
    
    // MARK: - Outlets
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var startTitleLabel: UILabel!
    @IBOutlet private weak var startLabel: UILabel!
    @IBOutlet private weak var endTitleLabel: UILabel!
    @IBOutlet private weak var endLabel: UILabel!
}
// MARK: - Binder
extension SeriesTableViewCell: Binder {
    func bind(_ viewModel: Any) {
        guard let viewModel = viewModel as? SeriesTableCellViewModel else { return }
        self.viewModel = viewModel
        guard let model = viewModel.getModel() as? SeriesDetail else { return }
        self.model = model
        setupViews(model: model)
    }
}

// MARK: Private
private extension SeriesTableViewCell {
    private func setupViews(model: SeriesDetail) {
        self.setupTitleLabel(text: model.title ?? "")
        self.setupTypeLabel(text: model.type ?? "No type")
        let startDate = model.startYear
        let endDate = model.endYear
        self.setupStartLabel(text: "\(String(describing: startDate))")
        self.setupEndLabel(text: "\(String(describing: endDate))")
    }
    
    func setupTitleLabel(text: String) {
        self.titleLabel.text = text
        self.titleLabel.font = UIFont(type: .montserratBlack)
    }
    
    func setupTypeLabel(text: String) {
        self.typeLabel.text = "Type: " + text
        self.typeLabel.font = UIFont(type: .montserratLight)
    }
    
    func setupStartLabel(text: String) {
        self.startLabel.text = text
        self.startLabel.font = UIFont(type: .montserratLight)
        self.startTitleLabel.font = UIFont(type: .montserratSemiBold)
    }
    
    func setupEndLabel(text: String) {
        self.endLabel.text = text
        self.endLabel.font = UIFont(type: .montserratLight)
        self.endTitleLabel.font = UIFont(type: .montserratSemiBold)
    }
}
