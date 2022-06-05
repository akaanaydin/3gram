//
//  HomeViewModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation
import Alamofire

// MARK: - View Model Protocol
protocol ViewModelProtocol {
    func fetchAlbums(onSuccess: @escaping ([AlbumModel]?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchPhotos(onSuccess: @escaping ([PhotoModel]?) -> Void, onError: @escaping (AFError) -> Void)
}

// MARK: - View Model
final class HomeViewModel: ViewModelProtocol {
    private let service: ServiceProtocol
    init(service: ServiceProtocol){
        self.service = service
    }
}

// MARK: - Extensions
extension HomeViewModel {
    // Fetch Albums
    func fetchAlbums(onSuccess: @escaping ([AlbumModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchAlbums { [weak self] data in
            guard let data = data else {
                onSuccess(nil)
                return
            }
            onSuccess(data)
        } onError: { error in
            onError(error)
        }

    }
    // Fetch Photos
    func fetchPhotos(onSuccess: @escaping ([PhotoModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchPhotos { [weak self] data in
            guard let data = data else {
                onSuccess(nil)
                return
            }
            onSuccess(data)
        } onError: { error in
            onError(error)
        }
    }
}
