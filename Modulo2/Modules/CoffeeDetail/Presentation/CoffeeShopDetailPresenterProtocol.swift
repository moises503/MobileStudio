//
//  CoffeeShopDetailPresenterProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

protocol CoffeeShopDetailPresenterProtocol {
    func attachView(view: CoffeeShopDetailViewProtocol)
    func obtainDetail(using coffeeShopId: String?)
}
