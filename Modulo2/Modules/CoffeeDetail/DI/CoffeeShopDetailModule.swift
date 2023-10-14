//
//  CoffeeShopDetailModule.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeShopDetailModule {
    
    static func providesEndPoint() -> CoffeeDetailEndPointProtocol {
        return CoffeeDetailEndPoint(networkManager: NetworkManager.shared)
    }
    
    static func providesDataSource() -> CoffeeShopDetailDataSourceProtocol {
        return CoffeeShopDetailDataSource(endPoint: providesEndPoint())
    }
    
    static func providesRepository() -> CoffeeShopDetailRepositoryProtocol {
        return CoffeeShopDetailRepository(dataSource: providesDataSource())
    }
    
    static func providesPresenter() -> CoffeeShopDetailPresenterProtocol {
        return CoffeeShopDetailPresenter(repository: providesRepository())
    }
}
