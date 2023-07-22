//
//  HomeDataSource.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomeDataSource: HomeDataSourceProtocol {
    
    func obtainNearCoffeeShops(with locationParams: LocationParams) -> HomeActionResult {
        return .success([])
    }
}
