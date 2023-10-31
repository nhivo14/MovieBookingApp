//
//  NetworkService.swift
//  TheMovieApp
//
//  Created by NhiVHY on 25/10/2023.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    // Base URL for your API
    let baseURL: String = "aaaaa"
    
    // Shared Alamofire session manager for making requests
    let sessionManager: Session
    
    private init() {
        
        // Initialize Alamofire session manager with custom configuration
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Request timeout
        self.sessionManager = Session(configuration: configuration)
    }
    
}

extension NetworkService {
    
    // Perform a GET request
    func get<T: Decodable>(
        endpoint: String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Swift.Result<T, Error>) -> Void
    ) {
        let fullURL = baseURL + endpoint
        
        sessionManager.request(fullURL, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data as! T))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // Perform a POST request
    func post<T: Decodable>(
        endpoint: String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Swift.Result<T, Error>) -> Void
    ) {
        let fullURL = baseURL + endpoint
        
        sessionManager.request(fullURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data as! T))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // Perform a PUT request
    func put<T: Decodable>(
        endpoint: String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Swift.Result<T, Error>) -> Void
    ) {
        let fullURL = baseURL + endpoint
        
        sessionManager.request(fullURL, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data as! T))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // Perform a DELETE request
    func delete<T: Decodable>(
        endpoint: String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Swift.Result<T, Error>) -> Void
    ) {
        let fullURL = baseURL + endpoint
        
        sessionManager.request(fullURL, method: .delete, parameters: parameters, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data as! T))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
