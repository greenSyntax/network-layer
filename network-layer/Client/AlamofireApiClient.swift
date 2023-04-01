//
//  AlamofireApiClient.swift
//  network-layer
//
//  Created by Abhishek Ravi on 01/04/23.
//

import Foundation
import Alamofire

final class AlamofireApiClient: NetworkClient {
    
    private let session = AF.session
    
    private func prepareURL(_ api: APIRequest) -> URL? {
        var urlComponents = URLComponents(string: api.url.absoluteString)
        let queryItems = api.queryParams?.map({ (key, value) in
            return URLQueryItem(name: key, value: String(describing: value) )
        })
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
    
    func dataTask<T>(_ api: APIRequest, onCompletion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = prepareURL(api) else {
            return onCompletion(.failure(AppError.invalidURL))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.allHTTPHeaderFields = api.headers
        urlRequest.httpBody = api.body
                
        AF.request(urlRequest).validate().response { response in
            
            // onFailure
            if let err = response.error {
                onCompletion(.failure(err))
                return
            }
            
            // onSuccess
            if let data = response.data {
                // Transform Data to Codable Type
                if let userModel = try? JSONDecoder().decode(T.self, from: data) {
                    onCompletion(.success(userModel))
                } else {
                    onCompletion(.failure(AppError.decodingError))
                }
            } else {
                onCompletion(.failure(AppError.noHttpBody))
            }
        }
    }
    
}
