//
//  NetworkBasic.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import Foundation
import Alamofire


enum StatusError: Int, Error, LocalizedError {
    case unauthorized  = 401
    case permissionDenied = 403
    case invalidServer = 500
    case missingParameter = 400
    
    var description: String {
        switch self {
        case .unauthorized:
            return "인증되지 않습니다."
        case .permissionDenied:
            return "권한이 없습니다."
        case .invalidServer:
            return "서버 점검 중입니다."
        case .missingParameter:
            return "검색어를 입력해주세요"
        }
    }
}



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
            return URL(string: baseURL + "\(id)")!
        case .random:
            return URL(string: baseURL + "/random")!
        }
    }
   
    
    
    
    
}












class NetworkBasic {
    static let shared = NetworkBasic()
    
    private init() { }
    
    func fetchRequest(completionHandler: @escaping((Result<[Beer],StatusError>) -> Void)) {
        
        let api = BeerAPI.all
        
        AF.request(api.endPoint).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(_):
                let status = response.response?.statusCode ?? 500
                guard let error = StatusError(rawValue: status) else { return }
                completionHandler(.failure(error))
            }
        }
    }
    
    func randomRequest(completionHandler: @escaping((Result<[Beer],StatusError>) -> Void)) {
        
        let api = BeerAPI.random
        
        AF.request(api.endPoint).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(_):
                let status = response.response?.statusCode ?? 500
                guard let error = StatusError(rawValue: status) else { return }
                completionHandler(.failure(error))
            }
        }
    }
    
    func singleRequest(id: Int,completionHandler: @escaping((Result<[Beer],StatusError>) -> Void)) {
        let api = BeerAPI.single(id: id)
        
        AF.request(api.endPoint).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(_):
                let status = response.response?.statusCode ?? 500
                guard let error = StatusError(rawValue: status) else { return }
                completionHandler(.failure(error))
            }
        }
    }
}
