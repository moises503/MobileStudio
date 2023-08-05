//
//  HomeRepositoryProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

protocol HomeRepositoryProtocol {
    func obtainNearCoffeeShops(with locationParams: LocationParams, onCoffeeShopsResult: @escaping (HomeActionResult) -> Void)
}
