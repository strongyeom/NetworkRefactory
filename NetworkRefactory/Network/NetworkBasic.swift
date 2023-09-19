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





class NetworkBasic {
    static let shared = NetworkBasic()
    
    private init() { }
    
    func fetchRequest(completionHandler: @escaping((Result<[Beer],StatusError>) -> Void)) {
        let url = URL(string: "https://api.punkapi.com/v2/beers")!
        
        AF.request(url).responseDecodable(of: [Beer].self) { response in
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
        let url = URL(string: "https://api.punkapi.com/v2/beers/random")!
        
        AF.request(url).responseDecodable(of: [Beer].self) { response in
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
    
    func singleRequest(completionHandler: @escaping((Result<[Beer],StatusError>) -> Void)) {
        let url = URL(string: "https://api.punkapi.com/v2/beers/1")!
        
        AF.request(url).responseDecodable(of: [Beer].self) { response in
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
