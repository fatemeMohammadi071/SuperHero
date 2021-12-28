//
//  SuperHerosViewController.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SuperHerosDisplayLogic: SuperHeroCellViewModelDelegate {
    func displaySuperHeros(viewModel: SuperHeros.SuperHeros.ViewModel)
    func displaySearchResult(viewModel: SuperHeros.SuperHeros.ViewModel)
    func displayLoading(viewModel: SuperHeros.Loading.ViewModel)
    func hideLoading(viewModel: SuperHeros.Loading.ViewModel)
    func displayError(viewModel: SuperHeros.ErrorModel.ViewModel)
}

class SuperHerosViewController: UIViewController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("SuperHerosViewController - Initialization using coder Not Allowed.")
    }
    
    init(factory: SuperHerosFactory) {
        super.init(nibName: SuperHerosViewController.nibName, bundle: nil)
        self.factory = factory
        setup()
        SuperHerosLogger.logInit(owner: String(describing: SuperHerosViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        SuperHerosLogger.logDeinit(owner: String(describing: SuperHerosViewController.self))
    }
    
    // MARK: - Properties
    var offset: Int = 0
    
    // MARK: Private
    private var factory: SuperHerosFactory!
    private lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
    
    // MARK: Public
    var interactor: SuperHerosBusinessLogic?
    var router: (NSObjectProtocol & SuperHerosRoutingLogic & SuperHerosDataPassing)?
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: DefaultTableView!
}

// MARK: - View Controller

// MARK: Life Cycle
extension SuperHerosViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupSearch()
        interactor?.fetchSuperHeros(request: SuperHeros.SuperHeros.Request(offset: 0))
    
    }
}

// MARK: - Methods

// MARK: Private
private extension SuperHerosViewController {
    // Setup
    func setup() {
        guard self.interactor == nil else { return }
        let viewController = self
        let interactor = SuperHerosInteractor()
        let presenter = SuperHerosPresenter()
        let router = SuperHerosRouter()
        let worker = SuperHerosWorker(service: factory.makeSuperHerosService())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupSearch() {
        searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.addTarget(self, action: #selector(self.textFieldValueChanged(_:)), for: .editingChanged)
    }
}

// MARK: Public
extension SuperHerosViewController {}

// MARK: - Display Logic
extension SuperHerosViewController: SuperHerosDisplayLogic {
    func displaySuperHeros(viewModel: SuperHeros.SuperHeros.ViewModel) {
        guard let sections = viewModel.sections else { return }
        let dataSource = DefaultTableViewDataSource(sections: sections, paginationDelegate: self)
        self.tableView.displayData(dataSource)
        self.tableView.reloadData()
    }
    
    func displaySearchResult(viewModel: SuperHeros.SuperHeros.ViewModel) {
        guard let sections = viewModel.sections else { return }
        let dataSource = DefaultTableViewDataSource(sections: sections)
        self.tableView.displayData(dataSource)
        self.tableView.reloadData()
    }
    
    func displayLoading(viewModel: SuperHeros.Loading.ViewModel) {
        self.view.endEditing(true)
        self.view.userInteractionOnLoading = false
        self.view.showLoading()
    }
    
    func hideLoading(viewModel: SuperHeros.Loading.ViewModel) {
        self.view.userInteractionOnLoading = true
        self.view.hideLoading()
    }
    
    func displayError(viewModel: SuperHeros.ErrorModel.ViewModel) {
        let action = UIAlertAction.init(title: "OK".localize(), style: .cancel, handler: nil)
        self.presentMessege(title: "Error".localize(), message: viewModel.requestError.localizedDescription, additionalActions: action, preferredStyle: .alert)
    }
}

// MARK: - PaginationProtocol
extension SuperHerosViewController: PaginationProtocol {
    func loadNextPage() {
        offset += 1
        interactor?.fetchSuperHeros(request: SuperHeros.SuperHeros.Request(offset: offset))
    }
}

// MARK: - SuperHeroCellViewModelDelegate
extension SuperHerosViewController: SuperHeroCellViewModelDelegate {
    func cellTapped(model: SuperHeroInfo?) {
        guard let model = model else { return }
        self.router?.navigateToSuperHeroDetail(superHeroInfo: model)
    }
}

// MARK: - Actions
extension SuperHerosViewController {}

extension SuperHerosViewController: UITextFieldDelegate {
    @objc func textFieldValueChanged(_ sender: UITextField) {
        guard let text = sender.text, !text.isEmpty else {
            self.interactor?.reloaViewController(request: SuperHeros.SuperHeros.Request(offset: 0))
            return
        }
        interactor?.searchCharacter(request: SuperHeros.Search.Request(name: text))
    }
}
