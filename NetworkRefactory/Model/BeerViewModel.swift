//
//  BeerViewModel.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import Foundation

class BeerViewModel {
    
    var beer = Observable<[Beer]>([])
    
    func request() {
        Network.shared.request(type: [Beer].self, api: BeerAPI.all) { beer in
            switch beer {
            case .success(let data):
                self.beer.value = data
            case .failure(let error):
                print(error)
            }
        }
    }
}
