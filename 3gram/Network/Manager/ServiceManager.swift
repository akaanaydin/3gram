//
//  ServiceManager.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 5.06.2022.
//

import Foundation
import Alamofire

// MARK: - Generic Service Manager
final class ServiceManager {
    
    public static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    
    func fetch<T>(path: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void)  where T : Codable {
        
        AF.request(path,
                   encoding: JSONEncoding.default
        ).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else {
                print(response.error as Any)
                return
            }
            onSuccess(model)
        }
    }
}


