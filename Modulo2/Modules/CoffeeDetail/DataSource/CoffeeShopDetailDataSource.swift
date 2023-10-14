//
//  CoffeeShopDetailDataSource.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeShopDetailDataSource: CoffeeShopDetailDataSourceProtocol {
    
    private var endPoint: CoffeeDetailEndPointProtocol
    
    init(endPoint: CoffeeDetailEndPointProtocol) {
        self.endPoint = endPoint
    }
    
    func getDetail(using coffeeShopId: String, withResult: @escaping (CoffeeDetailResult) -> Void) {
        endPoint.getDetail(using: coffeeShopId, withResult: withResult)
    }
}
