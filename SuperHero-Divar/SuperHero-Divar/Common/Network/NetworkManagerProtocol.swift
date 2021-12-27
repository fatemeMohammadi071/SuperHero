//
//  NetworkManagerProtocol.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<Request: RequestProtocol>(_ request: Request,
                                           onSuccess: @escaping (Data) -> Void,
                                           onFailure: @escaping (Error) -> Void)
    func request<Request: RequestProtocol>(_ request: Request,
                                           extraQueryParams: [String: Any]?,
                                           onSuccess: @escaping (Data) -> Void,
                                           onFailure: @escaping (Error) -> Void)
}
