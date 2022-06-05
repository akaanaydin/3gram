//
//  HomeViewModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation

protocol ViewModelProtocol {
    func fetchAlbums(completion: @escaping ([AlbumModel]?) -> Void)
    func fetchPhotos(completion: @escaping ([PhotoModel]?) -> Void)
}

final class HomeViewModel: ViewModelProtocol {
    private let service: ServiceProtocol
    init(service: ServiceProtocol){
        self.service = service
    }
}

extension HomeViewModel {
    func fetchAlbums(completion: @escaping ([AlbumModel]?) -> Void) {
        service.fetchAlbums { data in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
    func fetchPhotos(completion: @escaping ([PhotoModel]?) -> Void) {
        service.fetchPhotos { data in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
}
