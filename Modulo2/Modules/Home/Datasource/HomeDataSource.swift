//
//  HomeDataSource.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomeDataSource: HomeDataSourceProtocol {
    
    private var endPoint: CoffeeShopsEndPointProtocol
    
    init(endPoint: CoffeeShopsEndPointProtocol) {
        self.endPoint = endPoint
    }
    
    func obtainNearCoffeeShops(with locationParams: LocationParams, onCoffeeShopsResult: @escaping (HomeActionResult) -> Void) {
        endPoint.obtainCoffeeShops(with: locationParams, onCoffeeShopsResult: onCoffeeShopsResult)
    }
}
