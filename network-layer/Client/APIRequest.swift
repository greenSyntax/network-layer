//
//  APIRequest.swift
//  network-layer
//
//  Created by Abhishek Ravi on 01/04/23.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

struct APIRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let queryParams: [String: Any]?
    let body: Data?
}
