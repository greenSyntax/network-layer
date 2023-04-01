//
//  PostModel.swift
//  network-layer
//
//  Created by Abhishek Ravi on 01/04/23.
//

import Foundation

struct PostModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
