//
//  PhotoModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation

// MARK: - PhotoModel
struct PhotoModel: Codable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
