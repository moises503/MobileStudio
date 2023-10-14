//
//  CoffeeDetailEndPoint.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeDetailEndPoint: CoffeeDetailEndPointProtocol {
    
    private var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getDetail(using coffeeShopId: String, withResult: @escaping (CoffeeDetailResult) -> Void) {
        networkManager.makeRequest(endpoint: resolveCoffeeDetailEndPoint(using: coffeeShopId), method: .get) { (result: Result<CoffeeDetailResponse, Error>) in
            switch result {
            case .success(let response):
                withResult(.success(response.toCoffeeDetail()))
            case .failure(let error):
                debugPrint(error)
                withResult(.error(CoffeeAppError.networkError(error.localizedDescription)))
            }
        }
    }
    
    func resolveCoffeeDetailEndPoint(using coffeeShopId: String) -> String {
        return NetworkConfig.baseURL + "\(EndPoint.detail.rawValue)/\(coffeeShopId)"
    }
    
    enum EndPoint: String {
        case detail = "shop/detail"
    }
}
