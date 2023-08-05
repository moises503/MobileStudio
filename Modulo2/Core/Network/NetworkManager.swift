//
//  NetworkManager.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    

    // Alamofire session manager
    private let sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        return Session(configuration: configuration)
    }()
    
    // MARK: - Request methods
    func makeRequest<T: Codable>(
        endpoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        sessionManager.request(endpoint, method: method, parameters: parameters).validate().responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success:
                do {
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        let decodedResponse = try decoder.decode(T.self, from: data)
                        completion(.success(decodedResponse))
                    } else {
                        completion(.failure(NSError(domain: "No data received.", code: 0, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
