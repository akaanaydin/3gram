//
//  CommentViewModel.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 5.06.2022.
//

import Foundation

protocol CommentViewModelProtocol {
    func fetchComments(completion: @escaping ([CommentModel]?) -> Void)
}

final class CommentViewModel: CommentViewModelProtocol {
    private let service: ServiceProtocol
    init(service: ServiceProtocol){
        self.service = service
    }
}

extension CommentViewModel {
    
    func fetchComments(completion: @escaping ([CommentModel]?) -> Void) {
        service.fetchComments { data in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
}
