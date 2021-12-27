//
//  InfoDictionary.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

final class InfoDictionary {
    // MARK: - Enums
    enum Key: String {
        case baseURL = "Base URL"
        case appAPIKey = "API Key"
        case privateKey = "Private Key"
    }
    
    // MARK: Instance
    private let dictionary: [String: Any]!
    
    // MARK: Static
    static private(set) var main = InfoDictionary(Bundle.main.infoDictionary)
    
    init(_ dictionary: [String: Any]!) {
        self.dictionary = dictionary
    }
    
    // MARK: Base URL
    private(set) lazy var baseURL: String = self.dictionary?[Key.baseURL.rawValue] as? String ?? ""
    
    // MARK: appAPIKey
    private(set) lazy var APIKey: String = self.dictionary?[Key.appAPIKey.rawValue] as? String ?? ""
    
    // MARK: PrivateKey
    private(set) lazy var peivateKey: String = self.dictionary?[Key.privateKey.rawValue] as? String ?? ""
}
