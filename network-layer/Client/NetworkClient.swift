//
//  NetworkClient.swift
//  network-layer
//
//  Created by Abhishek Ravi on 31/03/23.
//

import Foundation


protocol NetworkClient {
    func dataTask<T: Codable>(_ api: APIRequest,
                              onCompletion: @escaping (_ result: Result<T, Error>) -> Void)
}

