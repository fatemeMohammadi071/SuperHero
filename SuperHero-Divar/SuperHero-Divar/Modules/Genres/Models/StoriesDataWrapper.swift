//
//  StoriesDataWrapper.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import Foundation

// MARK: - StroyDetail
struct StroyDetail: Codable {
    let id: Int?
    let title, resultDescription: String?
    let resourceURI: String?
    let type: String?
    let modified: String?
    let thumbnail: String?
    let creators: Creators?
    let characters, series, comics, events: StoryCharacters?
    let originalIssue: OriginalIssue?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, type, modified, thumbnail, creators, characters, series, comics, events, originalIssue
    }
}

// MARK: - Characters
struct StoryCharacters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [OriginalIssue]?
    let returned: Int?
}

// MARK: - OriginalIssue
struct OriginalIssue: Codable {
    let resourceURI: String?
    let name: String?
}

enum Role: String, Codable {
    case colorist = "colorist"
    case editor = "editor"
    case inker = "inker"
    case letterer = "letterer"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case writer = "writer"
}
