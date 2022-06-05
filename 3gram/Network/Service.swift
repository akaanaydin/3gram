//
//  Service.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func fetchAlbums(completion: @escaping ([AlbumModel]?) -> Void)
    func fetchPhotos(completion: @escaping ([PhotoModel]?) -> Void)
    func fetchComments(completion: @escaping ([CommentModel]?) -> Void)
}

final class Service:ServiceProtocol {
    
    func fetchAlbums(completion: @escaping ([AlbumModel]?) -> Void) {
        AF.request(Constant.NetworkConstant.AlbumServiceEndPoint.fetchAlbums()).responseDecodable(of: [AlbumModel].self) { data in
            guard let data = data.value else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
    func fetchPhotos(completion: @escaping ([PhotoModel]?) -> Void) {
        AF.request(Constant.NetworkConstant.AlbumServiceEndPoint.fetchPhotos()).responseDecodable(of: [PhotoModel].self) { data in
            guard let data = data.value else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
    func fetchComments(completion: @escaping ([CommentModel]?) -> Void) {
        AF.request(Constant.NetworkConstant.AlbumServiceEndPoint.fetchComments()).responseDecodable(of: [CommentModel].self) { data in
            guard let data = data.value else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
}
