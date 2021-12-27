//
//  ComicDataWrapper.swift
//  SuperHero
//
//  Created by Fateme on 10/4/1400 AP.
//

import Foundation

// MARK: - ComicDetail
struct ComicDetail: Codable {
    let id, digitalID, issueNumber: Int?
    let title: String?
    let variantDescription, resultDescription, modified, isbn: String?
    let upc, diamondCode, ean, issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [URLElement]?
    let series: Series?
    let variants, collections, collectedIssues: [Series]?
    let dates: [DateElement]?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
    let creators, characters: Characters?
    let stories: Stories?
    let events: Events?

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case resultDescription = "description"
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [CharactersItem]?
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI, name, role: String?
}

// MARK: - Series
struct Series: Codable {
    let resourceURI, name: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    let type, date: String?
}

// MARK: - Events
struct Events: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [Series]?
}

// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Double?
}

// MARK: - TextObject
struct TextObject: Codable {
    let type, language, text: String?
}
