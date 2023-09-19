//
//  BeerAPI.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerAPI {
    
    private var baseURL: String {
        return "https://api.punkapi.com/v2/beers"
    }
    
    case all
    case single(id: Int)
    case random
    
    var endPoint: URL {
        switch self {
        case .all:
            return URL(string: baseURL)!
        case .single(let id):
            return URL(string: baseURL + "/\(id)")!
        case .random:
            return URL(string: baseURL + "/random")!
        }
    }
    
    var mathod: HTTPMethod {
        return .get
    }
}
