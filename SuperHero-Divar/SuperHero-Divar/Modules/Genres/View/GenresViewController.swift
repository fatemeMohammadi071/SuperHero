//
//  GenresViewController.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GenresDisplayLogic: AnyObject {
    func displayGenres(viewModel: Genres.Genres.ViewModel)
    func displayLoading(viewModel: Genres.Loading.ViewModel)
    func hideLoading(viewModel: Genres.Loading.ViewModel)
    func displayError(viewModel: Genres.ErrorModel.ViewModel)
    func displayEmptyList(viewModel: Genres.EmptyList.ViewModel)
}

class GenresViewController: UIViewController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("GenresViewController - Initialization using coder Not Allowed.")
    }
    
    init(factory: GenresFactory) {
        super.init(nibName: GenresViewController.nibName, bundle: nil)
        self.factory = factory
        setup()
        GenresLogger.logInit(owner: String(describing: GenresViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        GenresLogger.logDeinit(owner: String(describing: GenresViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private var factory: GenresFactory!
    
    // MARK: Public
    var interactor: GenresBusinessLogic?
    var router: (NSObjectProtocol & GenresRoutingLogic & GenresDataPassing)?
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: DefaultTableView!
}

// MARK: - View Controller

// MARK: Life Cycle
extension GenresViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        interactor?.fetchGenres(request: Genres.Genres.Request())

    }
}

// MARK: - Methods

// MARK: Private
private extension GenresViewController {
    // Setup
    func setup() {
        guard self.interactor == nil else { return }
        let viewController = self
        let interactor = GenresInteractor()
        let presenter = GenresPresenter()
        let router = GenresRouter()
        let worker = GenresWorker(service: factory.makeGenresService())
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
extension GenresViewController {}

// MARK: - Display Logic
extension GenresViewController: GenresDisplayLogic {
    
    func displayGenres(viewModel: Genres.Genres.ViewModel) {
        let sections = viewModel.sections
        let dataSource = DefaultTableViewDataSource(sections: sections)
        self.tableView.displayData(dataSource)
    }
    
    func displayLoading(viewModel: Genres.Loading.ViewModel) {
        self.view.endEditing(true)
        self.view.userInteractionOnLoading = false
        self.view.showLoading()
    }
    
    func hideLoading(viewModel: Genres.Loading.ViewModel) {
        self.view.userInteractionOnLoading = true
        self.view.hideLoading()
    }
    
    func displayError(viewModel: Genres.ErrorModel.ViewModel) {
        let action = UIAlertAction.init(title: "OK".localize(), style: .cancel, handler: nil)
        self.presentMessege(title: "Error".localize(), message: viewModel.requestError.localizedDescription, additionalActions: action, preferredStyle: .alert)
    }
    
    func displayEmptyList(viewModel: Genres.EmptyList.ViewModel) {
        self.tableView.showEmptyListView("There is no \(viewModel.type)")
    }
}

// MARK: - Actions
extension GenresViewController {}
