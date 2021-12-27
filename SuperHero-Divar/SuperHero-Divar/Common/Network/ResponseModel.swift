//
//  ResponseModel.swift
//  SuperHero
//
//  Created by Fateme on 12/27/21.
//

import Foundation

// MARK: - ResponseModel
struct ResponseModel<T: Codable>: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass<T>?
}

// MARK: - DataClass
struct DataClass<T: Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}
