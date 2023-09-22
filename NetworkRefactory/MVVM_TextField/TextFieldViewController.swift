//
//  TextFieldViewController.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import UIKit
import SnapKit

class TextFieldViewController : UIViewController {
    
    // 더하는 MVVM 만들어보자
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let resultLabel = UILabel()
    
    let viewModel = TextFieldViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [firstTextField, secondTextField, resultLabel].forEach {
            view.addSubview($0)
        }
        setConstraints()
        
        firstTextField.text = viewModel.first.value
        secondTextField.text = viewModel.second.value
        
        /*
         텍스트 필드인 경우에는 입력값을 실시간으로 받거나, return 값을 통해서 한번에 받을 수 있기 때문에 addtarget을 사용해서 Observable value 값을 바꿔줄 수 있다
         listener 클로저는 bind를 실행할때 실행문이 담긴다.
         value 값이 바뀌면 didSet을 통해 listener 클로저가 탄다.
         그렇기 때문에 시점이 중요한데, 먼저 기본값이 있고 그 다음 변경 되었을때 탈 수 있게 코드를 적는다.
         */
        
        firstTextField.addTarget(self, action: #selector(fristTextFieldEditChanged), for: .editingChanged)
       
        viewModel.result.bind { text in
            self.resultLabel.text = text
        }
       
        
    }
    
    @objc func fristTextFieldEditChanged() {
        viewModel.first.value = firstTextField.text!
        viewModel.calculate()
    }
    
    func setConstraints() {
        
        firstTextField.backgroundColor = .lightGray
        firstTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        secondTextField.backgroundColor = .lightGray
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(firstTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(50)
        }
        
        resultLabel.text = "결과값"
        resultLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    
    
    
    
    
}
