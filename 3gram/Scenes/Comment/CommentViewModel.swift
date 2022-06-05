//
//  CommentViewModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 5.06.2022.
//

import Foundation
import Alamofire

// MARK: - Comment View Model Protocol
protocol CommentViewModelProtocol {
    func fetchComments(onSuccess: @escaping ([CommentModel]?) -> Void, onError: @escaping (AFError) -> Void)
}

// MARK: - Comment View Model
final class CommentViewModel: CommentViewModelProtocol {

    private let service: ServiceProtocol
    init(service: ServiceProtocol){
        self.service = service
    }
}

// MARK: - Extensions
extension CommentViewModel {
    // Fetch Comments
    func fetchComments(onSuccess: @escaping ([CommentModel]?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchComments { [weak self] data in
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
