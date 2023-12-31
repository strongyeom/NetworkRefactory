//
//  Photo.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]?
}

struct PhotoResult: Codable {
    let id: String
    let created_at: String
    let description: String?
    let likes: Int
}
