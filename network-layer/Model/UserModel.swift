//
//  UserModel.swift
//  network-layer
//
//  Created by Abhishek Ravi on 01/04/23.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
}

struct UserAddress: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}
