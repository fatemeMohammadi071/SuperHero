//
//  NetworkManager.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    let service = QueryService()
    
    func request<Request>(_ request: Request,
                          onSuccess: @escaping (Data) -> Void,
                          onFailure: @escaping (Error) -> Void) where Request : RequestProtocol {
        service.request(request: request) { (result) in
            switch result {
            case .success((let data)):
                onSuccess(data)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func request<Request>(_ request: Request,
                          extraQueryParams: [String: Any]?,
                          onSuccess: @escaping (Data) -> Void,
                          onFailure: @escaping (Error) -> Void) where Request : RequestProtocol {
        service.request(request: request, extraQueryParams: extraQueryParams) { (result) in
            switch result {
            case .success((let data)):
                onSuccess(data)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}
