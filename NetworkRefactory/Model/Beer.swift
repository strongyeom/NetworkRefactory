//
//  Beer.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import Foundation

// MARK: - Beer
struct Beer: Decodable {
    let id: Int
    let name, description: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case imageURL = "image_url"
    }
}
