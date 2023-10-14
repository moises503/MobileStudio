//
//  CoffeeShopDetailDataSourceProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

protocol CoffeeShopDetailDataSourceProtocol {
    func getDetail(using coffeeShopId: String, withResult: @escaping (CoffeeDetailResult) -> Void)
}
