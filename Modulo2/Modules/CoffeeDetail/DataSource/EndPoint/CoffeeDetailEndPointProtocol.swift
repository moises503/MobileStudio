//
//  CoffeeDetailEndPointProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

protocol CoffeeDetailEndPointProtocol {
    func getDetail(using coffeeShopId: String, withResult: @escaping (CoffeeDetailResult) -> Void)
    func resolveCoffeeDetailEndPoint(using coffeeShopId: String) -> String
}
