//
//  Network.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import Foundation
import Alamofire

class Network {
    static let shared = Network()
    
    private init() { }
    
    func request<T: Decodable>(type: T.Type, api: BeerAPI, completionHandler: @escaping((Result<T,StatusError>) -> Void)) {
        
        AF.request(api.endPoint).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(_):
                // response.response?에서 만약에 nil이 나오면 500을 리턴 해준다.
                let statusCode = response.response?.statusCode ?? 500
                guard let error = StatusError(rawValue: statusCode) else { return }
                completionHandler(.failure(error)) // 실패에 대해서만 던짐
            }
        }
    }
}
