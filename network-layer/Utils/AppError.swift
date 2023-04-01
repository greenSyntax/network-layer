//
//  AppError.swift
//  network-layer
//
//  Created by Abhishek Ravi on 01/04/23.
//

import Foundation

enum AppError: Error {
    case invalidURL
    case noHttpBody
    case httpFailure
    case decodingError
    case error(Error)
    case custom(String)
}
