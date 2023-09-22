//
//  ViewController.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = BeerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        Network.shared.request(type: [Beer].self, api: .single(id: 1)) { response in
//            switch response {
//            case .success(let success):
//                dump(success)
//            case .failure(let failure):
//                print(failure.description)
//            }
//        }
//
        viewModel.request()
        viewModel.beer.bind { beer in
            print("여기가 탑니다. beer",beer.count)
        }
       
    }
}

