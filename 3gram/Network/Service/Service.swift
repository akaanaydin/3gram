//
//  Service.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation
import Alamofire
// MARK: - Services Protocol
protocol ServiceProtocol {
    func fetchAlbums(onSuccess: @escaping ([AlbumModel]?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchPhotos(onSuccess: @escaping ([PhotoModel]?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchComments(onSuccess: @escaping ([CommentModel]?) -> Void, onError: @escaping (AFError) -> Void)
}
// MARK: - Services
final class Service:ServiceProtocol {
    // Fetch Albums
    func fetchAlbums(onSuccess: @escaping ([AlbumModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.AlbumServiceEndPoint.fetchAlbums()) { (response: [AlbumModel]) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }

    }
    // Fetch Photos
    func fetchPhotos(onSuccess: @escaping ([PhotoModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.AlbumServiceEndPoint.fetchPhotos()) { (response: [PhotoModel]) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
    // Fetch Comments
    func fetchComments(onSuccess: @escaping ([CommentModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.AlbumServiceEndPoint.fetchComments()) { (response: [CommentModel]) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
