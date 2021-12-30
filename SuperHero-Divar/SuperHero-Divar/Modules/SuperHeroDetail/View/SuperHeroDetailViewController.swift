//
//  SuperHeroDetailViewController.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHeroDetailDisplayLogic: SuperHeroDetailCellViewModelDelegate {
    func displaySuperHeroDetail(viewModel: SuperHeroDetail.SuperHeroDetail.ViewModel)
}

class SuperHeroDetailViewController: UIViewController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("SuperHeroDetailViewController - Initialization using coder Not Allowed.")
    }
    
    init(factory: SuperHeroDetailFactory) {
        super.init(nibName: SuperHeroDetailViewController.nibName, bundle: nil)
        self.factory = factory
        setup()
        SuperHeroDetailLogger.logInit(owner: String(describing: SuperHeroDetailViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHeroDetailLogger.logDeinit(owner: String(describing: SuperHeroDetailViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private var factory: SuperHeroDetailFactory!
    
    // MARK: Public
    var interactor: SuperHeroDetailBusinessLogic?
    var router: (NSObjectProtocol & SuperHeroDetailRoutingLogic & SuperHeroDetailDataPassing)?
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: DefaultTableView!

}

// MARK: - View Controller

// MARK: Life Cycle
extension SuperHeroDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        interactor?.ShowDetail(request: SuperHeroDetail.SuperHeroDetail.Request())
    }
}

// MARK: - Methods

// MARK: Private
private extension SuperHeroDetailViewController {
    // Setup
    func setup() {
        guard self.interactor == nil else { return }
        let viewController = self
        let interactor = SuperHeroDetailInteractor()
        let presenter = SuperHeroDetailPresenter()
        let router = SuperHeroDetailRouter()
        let worker = SuperHeroDetailWorker(service: factory.makeSuperHeroDetailService())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

// MARK: Public
extension SuperHeroDetailViewController {}

// MARK: - Display Logic
extension SuperHeroDetailViewController: SuperHeroDetailDisplayLogic {
    func displaySuperHeroDetail(viewModel: SuperHeroDetail.SuperHeroDetail.ViewModel) {
        guard let sections = viewModel.sections else { return }
        let dataSource = DefaultTableViewDataSource(sections: sections)
        self.tableView.displayData(dataSource)
    }
}

// MARK: - SuperHeroDetailCellViewModelDelegate
extension SuperHeroDetailViewController: SuperHeroDetailCellViewModelDelegate {
    func cellTapped(characterId: Int?, type: SuperHeroInfoDetailType) {
        guard let characterId = characterId else { return }
        router?.navigateToGenres(type: type, characterId: characterId)
    }

}

// MARK: - Actions
extension SuperHeroDetailViewController {}
