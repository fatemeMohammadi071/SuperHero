//
//  EventsDataWrapper.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import Foundation

// MARK: - EventDetail
struct EventDetail: Codable {
    let id: Int?
    let title, resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let modified: String?
    let start, end: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: EventCharacters?
    let stories: Stories?
    let comics, series: EventCharacters?
    let next, previous: Next?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, urls, modified, start, end, thumbnail, creators, characters, stories, comics, series, next, previous
    }
}

// MARK: - Characters
struct EventCharacters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Next]?
    let returned: Int?
}

// MARK: - Next
struct Next: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String?
    let name, role: String?
}
