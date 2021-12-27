//
//  QueryService.swift
//  SuperHero
//
//  Created by Fateme on 10/2/1400 AP.
//

import Foundation

class QueryService {
    
  let defaultSession = URLSession(configuration: .default)
    
  var dataTask: URLSessionDataTask?


  typealias JSONDictionary = [String: Any]
    typealias completionHandler = ((Swift.Result<Data, Error>) -> Void)

    func request(request: RequestProtocol, extraQueryParams: [String: Any]? = nil, completion: @escaping completionHandler) {
    dataTask?.cancel()
        let baseUrl = request.baseURL + request.relativePath
    if var urlComponents = URLComponents(string: baseUrl) {
        urlComponents.queryItems = generateQueryItem(request: request, extraQueryParams: extraQueryParams)
      if let url = urlComponents.url  {
        self.dataTask = defaultSession.dataTask(testetst: url) { (result) in
            switch result {
            case .success((_, let data)):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
      }
//        defaultSession.dataTask(with: url) { [weak self] data, response, error in
//        defer {
//          self?.dataTask = nil
//        }
//
//        if let error = error {
//            completion(.failure(error))
//        } else if
//          let data = data,
//          let response = response as? HTTPURLResponse,
//          response.statusCode == 200 {
//
//
//          DispatchQueue.main.async {
//            completion(.success(data))
//          }
//        }
//      }
      
      dataTask?.resume()
    }
  }
}

private extension QueryService {
    private func generateQueryItem(request: RequestProtocol, extraQueryParams: [String: Any]? = nil) -> [URLQueryItem] {
        var queryItems = [
            URLQueryItem(name: "limit", value: "\(request.limit)"),
            URLQueryItem(name: "offset", value: "\(request.offset)"),
            URLQueryItem(name: "ts", value: "\(request.ts)"),
            URLQueryItem(name: "apikey", value: "\(request.apiKey)"),
            URLQueryItem(name: "hash", value: "\(request.hash)")]
        if extraQueryParams != nil {
            queryItems += extraQueryParams?.map({ (key, value) in
                URLQueryItem(name: key, value: "\(value)")
            }) ?? []
        }
        return queryItems
    }
}
extension URLSession {

    enum HTTPError: Error {
        case transportError(Error)
        case serverSideError(Int)
    }

    typealias DataTaskResult = Result<(HTTPURLResponse, Data), Error>

    func dataTask(testetst: URL, completionHandler: @escaping (DataTaskResult) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: testetst) { (data, response, error) in
            if let error = error {
                completionHandler(Result.failure(HTTPError.transportError(error)))
                return
            }
            let response = response as! HTTPURLResponse
            let status = response.statusCode
            guard (200...299).contains(status) else {
                completionHandler(Result.failure(HTTPError.serverSideError(status)))
                return
            }
            completionHandler(Result.success((response, data!)))
        }
    }
}
