//
//  Parsable.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation
protocol Parsable {
    associatedtype Object: Codable
    func parse(data: Data) -> Object?
}
