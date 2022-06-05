//
//  NetworkConstant.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation

extension Constant {
    class NetworkConstant{
        enum AlbumServiceEndPoint: String {
        case BASE_URL = "https://jsonplaceholder.typicode.com"
        case ALBUMS = "/albums"
        case PHOTOS = "/photos"
        case COMMENTS = "/comments"
            
            static func fetchAlbums() -> String {
                "\(BASE_URL.rawValue)\(ALBUMS.rawValue)"
            }
            
            static func fetchPhotos() -> String {
                "\(BASE_URL.rawValue)\(PHOTOS.rawValue)"
            }
            
            static func fetchComments() -> String {
                "\(BASE_URL.rawValue)\(COMMENTS.rawValue)"
            }
            
        }
    }
}
