//
//  Model.swift
//  FriendsApp
//
//  Created by Александр Басов on 1/6/22.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let id: String?
    let index: Int?
    let guid: String?
    let isActive: Bool?
    let balance: String?
    let picture: String?
    let age: Int?
    let eyeColor, name, gender, company: String?
    let email, phone, address, about: String?
    let registered: String?
    let latitude, longitude: Double?
    let tags: [String]?
    let friends: [Friend]?
    let greeting, favoriteFruit: String?

    enum CodingKeys: String, CodingKey {
        case id
        case index, guid, isActive, balance, picture, age, eyeColor, name, gender, company, email, phone, address, about, registered, latitude, longitude, tags, friends, greeting, favoriteFruit
    }
}

// MARK: - Friend
struct Friend: Codable {
    let id: Int?
    let name: String?
}

typealias Result = [Person]

