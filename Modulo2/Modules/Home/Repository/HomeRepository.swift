//
//  HomeRepository.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

class HomeRepository: HomeRepositoryProtocol {
    
    private var dataSource: HomeDataSourceProtocol
    
    init(dataSource: HomeDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func obtainNearCoffeeShops(with locationParams: LocationParams, onCoffeeShopsResult: @escaping (HomeActionResult) -> Void) {
        dataSource.obtainNearCoffeeShops(with: locationParams, onCoffeeShopsResult: onCoffeeShopsResult)
    }
}
