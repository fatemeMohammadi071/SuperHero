//
//  SuperHerosFactory.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias SuperHerosFactory = SuperHerosViewControllerFactory & SuperHerosServiceFactory

protocol SuperHerosViewControllerFactory {
    func makeSuperHerosViewController() -> SuperHerosViewController
}

protocol SuperHerosServiceFactory {
    func makeSuperHerosService() -> SuperHerosService
}
