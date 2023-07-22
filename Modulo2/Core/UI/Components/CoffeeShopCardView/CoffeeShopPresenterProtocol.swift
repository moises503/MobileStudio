//
//  CoffeeShopPresenterProtocol.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 08/07/23.
//

import Foundation

protocol CoffeeShopPresenterProtocol {
    func attachView(view: CoffeeShopViewProtocol)
    func renderCoffeeShopView(using coffeeShopView: CoffeeShopView?)
}
