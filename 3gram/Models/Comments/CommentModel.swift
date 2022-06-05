//
//  CommentModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 4.06.2022.
//

import Foundation

// MARK: - CommentModel
struct CommentModel: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
