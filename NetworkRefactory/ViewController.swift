//
//  ViewController.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkBasic.shared.randomRequest { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.description)
            }
        }
    }


}

