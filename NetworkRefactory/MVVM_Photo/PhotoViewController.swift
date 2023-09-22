//
//  PhotoViewController.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import UIKit
import SnapKit

class PhotoViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    let viewModel = PhotoViewModel()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
       settup()
       setContraints()
       networkViewModel()
        
    }
    
    
    func settup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    func setContraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func networkViewModel() {
        
//        viewModel.request(searchText: "sky")
//        // 테이블뷰가 있다면 데이터가 변할때마다 reload를 해준다.
//        viewModel.photoValue.bind { _ in
//            print("")
//            // 암묵적으로 Alamofire을 사용할때 비동기 후 -> mainThread에서 실행되는 것이 있지만
//            // 사용자의 가독성을 위해 MainThread 명시해주기
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        viewModel.randomPhotosReqeust()
        viewModel.randomPhotos.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.randomPhotos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.label.text = viewModel.randomPhotos.value[indexPath.row].id
            return cell
    }
}

extension PhotoViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.request(searchText: searchBar.text!)
    }
}
