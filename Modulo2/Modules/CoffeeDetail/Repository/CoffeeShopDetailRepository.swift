//
//  CoffeeShopDetailRepository.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeShopDetailRepository: CoffeeShopDetailRepositoryProtocol {
    
    private var dataSource: CoffeeShopDetailDataSourceProtocol
    
    init(dataSource: CoffeeShopDetailDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getDetail(using coffeeShopId: String, withResult: @escaping (CoffeeDetailResult) -> Void) {
        dataSource.getDetail(using: coffeeShopId, withResult: withResult)
    }
}
