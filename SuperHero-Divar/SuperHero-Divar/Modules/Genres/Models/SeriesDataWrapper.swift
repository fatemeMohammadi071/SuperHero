//
//  SeriesDataWrapper.swift
//  SuperHero
//
//  Created by Fateme on 12/28/21.
//

// MARK: - SeriesDetail
struct SeriesDetail: Codable {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let startYear, endYear: Int?
    let rating, type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: Characters?
    let characters: SeriesCharacters?
    let stories: Stories?
    let comics, events: SeriesCharacters?
    let next, previous: Next?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, urls, startYear, endYear, rating, type, modified, thumbnail, creators, characters, stories, comics, events, next, previous
    }
}

// MARK: - Characters
struct SeriesCharacters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Next]?
    let returned: Int?
}
