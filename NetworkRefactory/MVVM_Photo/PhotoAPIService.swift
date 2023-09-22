//
//  PhotoAPIService.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import Foundation
import Alamofire

class PhotoAPIService {
    // 싱글톤 패턴
    static let shared = PhotoAPIService()
    
    private init() { }
    
    func callReqest(searchText: String, completionHandler: @escaping (Photo?) -> Void) {
        let url = URL(string: "https://api.unsplash.com/search/photos?query=\(searchText)&client_id=R87kkJUhEVTR_QPQo8pQOj7Q7sgWnUP8gTE8h0yOHB0")!
        
        AF.request(url)
            .responseDecodable(of: Photo.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
    func randomPhotosCallRequest(completionHandler: @escaping([PhotoResult]) -> Void) {
        let url = URL(string: "https://api.unsplash.com/photos/random?client_id=R87kkJUhEVTR_QPQo8pQOj7Q7sgWnUP8gTE8h0yOHB0&count=10")!
        AF.request(url)
            .responseDecodable(of: [PhotoResult].self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
