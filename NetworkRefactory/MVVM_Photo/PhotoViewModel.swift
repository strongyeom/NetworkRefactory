//
//  PhotoViewModel.swift
//  NetworkRefactory
//
//  Created by 염성필 on 2023/09/22.
//

import Foundation

class PhotoViewModel {
    
    let photoValue = Observable(Photo(total: 0, total_pages: 0, results: []))
    let randomPhotos = Observable([PhotoResult(id: "", created_at: "", description: "", likes: 0)])
    
    func request(searchText: String) {
        PhotoAPIService.shared.callReqest(searchText: searchText) { photo in
            guard let photo else { return }
            self.photoValue.value = photo
            dump(self.photoValue.value)
        }
    }
    
    func randomPhotosReqeust() {
        PhotoAPIService.shared.randomPhotosCallRequest { response in
            self.randomPhotos.value = response
        }
    }
}
