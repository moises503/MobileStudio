//
//  CoffeeShopViewProtocol.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 08/07/23.
//

import Foundation

protocol CoffeeShopViewProtocol: AnyObject {
    func displayCoffeeShopView(with coffeeShopView: CoffeeShopView)
    func markAsFavorite()
    func markAsNonFavorite()
    func petFriendlyAvalaible()
    func bakeryAvailable()
    func coffeeAvailable()
    func foodAvailable()
}
