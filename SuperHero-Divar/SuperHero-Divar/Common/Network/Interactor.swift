//
//  Interactor.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

class Interactor<Model: Codable>: Parsable {
    typealias Object = Model
    func parse(data: Data) -> Model? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        do {
            let model = try decoder.decode(Model.self, from: data)
            return model
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
            
        }
    }
}
