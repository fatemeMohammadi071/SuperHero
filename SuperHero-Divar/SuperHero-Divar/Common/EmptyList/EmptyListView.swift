//
//  EmptyListView.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import UIKit

protocol EmptyListViewProtocol {
    func setEmptyText(_ text: String?)
    func setIcon(_ image: UIImage?)
    func configureButton(_ text: String?, onTapHandler: (() -> Void)?)
}

class EmptyListView: UIView {
    @IBOutlet private weak var emptyText: UILabel! {
        didSet {
            // FIXME: Fateme, Color
            self.emptyText.textColor = .gray//UIColor(colorName: .appGray)
        }
    }

    @IBOutlet private weak var icon: UIImageView! {
        didSet {
            self.icon.addCornerRadius(icon.frame.height/2)
        }
    }
    @IBOutlet private weak var imageContainer: UIView! {
        didSet {
            self.imageContainer.isHidden = true
        }
    }

    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var buttonContainer: UIView! {
        didSet {
            self.buttonContainer.isHidden = true
        }
    }
}

extension EmptyListView: EmptyListViewProtocol {
    func setEmptyText(_ text: String?) {
        self.emptyText.text = text
    }

    func setIcon(_ image: UIImage?) {
        self.imageContainer.isHidden = image == nil
        self.icon.image = image
    }

    func configureButton(_ text: String?, onTapHandler: (() -> Void)?) {
        self.buttonContainer.isHidden = text == nil
        self.button.setTitle(text, for: .normal)
    }
}
