//
//  SuperHerosLogger.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SuperHerosLogger: Logger {
    override class var prefix: String {
        return "SuperHeros"
    }
}
