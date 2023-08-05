//
//  CoffeeShopsEndPointProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

protocol CoffeeShopsEndPointProtocol {
    func obtainCoffeeShops(with locationParams: LocationParams, onCoffeeShopsResult: @escaping (HomeActionResult) -> Void)
    func resolveCoffeeShopEndPoint() -> String
}
