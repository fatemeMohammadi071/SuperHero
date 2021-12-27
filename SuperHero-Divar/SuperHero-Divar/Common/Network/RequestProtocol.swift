//
//  RequestProtocol.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
}

public enum AuthType {
    case none
    case basic
    case bearer
    case custom(String)

    public var value: String? {
        switch self {
        case .none: return nil
        case .basic: return "Basic"
        case .bearer: return "Bearer"
        case .custom(let customValue): return customValue
        }
    }
}

public struct FormData {

    public enum FormDataProvider {
        case data(Foundation.Data)
        case file(URL)
        case stream(InputStream, UInt64)
    }

    public init(provider: FormDataProvider, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.provider = provider
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }

    public let provider: FormDataProvider
    public let name: String
    public let fileName: String?
    public let mimeType: String?

}

public enum RequestType {
    case requestPlain
    case requestJSONEncodable(Encodable)
    case requestParameters(urlParameters: [String: Any])
    case uploadCompositeMultipart([FormData], urlParameters: [String: Any]?)
    case uploadFile(URL)
}

protocol RequestProtocol {
    var baseURL: String {get}
    var relativePath: String {get}
    var method: HTTPMethod {get}
    var headers: [String: String]? {get}
    var authorizationType: AuthType {get}
    var requestType: RequestType {get}
    var limit: Int {get}
    var offset: Int {get}
    var hash: String {get}
    var ts: String {get}
    var apiKey: String {get}
}

extension RequestProtocol {
    var baseURL: String {
        return InfoDictionary.main.baseURL
    }
    
    var authorizationType: AuthType {
        return .bearer
    }
    
    var limit: Int {
        return 100
    }
    
    var offset: Int {
        return 0
    }
    
    var ts: String {
        return "1"
    }
    
    var apiKey: String {
        return InfoDictionary.main.APIKey
    }
    var hash: String {
        let hash = ts + InfoDictionary.main.peivateKey + apiKey
        return hash.md5
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
}

struct ExtraQueryParam {
    let name: String?
}
