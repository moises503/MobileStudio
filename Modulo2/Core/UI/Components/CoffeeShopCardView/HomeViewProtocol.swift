//
//  HomeViewProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

protocol HomeViewProtocol : AnyObject {
    func showDefaultLocation(with favoriteLocation: Location)
    func requestLocation()
    func showCoffeeShops(with coffeeShopsList: [CoffeeShop])
    func showError(message: String)
    
    /// To request location permission
    func permissionDenied()
    func proceedToRequestLocation()
}
