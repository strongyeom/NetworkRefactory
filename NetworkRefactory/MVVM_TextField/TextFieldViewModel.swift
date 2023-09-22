//
//  TextFieldViewModel.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import Foundation

class TextFieldViewModel {
    
    let first = Observable("3")
    let second = Observable("10")
    let result = Observable("결과값")
    
    func calculate() {
        if let firstConvertToString = Int(first.value),
           let secondConvertToString = Int(second.value) {
            result.value = "\(firstConvertToString + secondConvertToString)"
        }
    }
}
