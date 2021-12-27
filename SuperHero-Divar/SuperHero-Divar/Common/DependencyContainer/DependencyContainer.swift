//
//  DependencyContainer.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

public class DependencyContainer {
    lazy var networkManager: NetworkManagerProtocol = AppDelegate.getInstance().networkManager
}
