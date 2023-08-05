//
//  CoffeeShopsEndPoint.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation


class CoffeeShopsEndPoint: CoffeeShopsEndPointProtocol {
    
    private var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func obtainCoffeeShops(with locationParams: LocationParams, onCoffeeShopsResult: @escaping (HomeActionResult) -> Void) {
        networkManager.makeRequest(endpoint: resolveCoffeeShopEndPoint(), method: .get) { (result: Result<CoffeeShopsReponse, Error>) in
            switch result {
            case .success(let response):
                onCoffeeShopsResult(.success(response.shops.toCoffeeShopList()))
            case .failure(let error):
                debugPrint(error)
                onCoffeeShopsResult(.error(CoffeeAppError.networkError(error.localizedDescription)))
            }
        }
    }
    
    
    func resolveCoffeeShopEndPoint() -> String {
        return NetworkConfig.baseURL + EndPoint.getShops.rawValue
    }
    
    
    enum EndPoint: String {
        case getShops = "shops"
    }
}
