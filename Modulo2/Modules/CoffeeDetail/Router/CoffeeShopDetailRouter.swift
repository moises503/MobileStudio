//
//  CoffeeShopDetailRouter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeShopDetailRouter: CoffeeShopDetailRouterProtocol {
    
    static func launch(using coffeeShopId: String) -> CoffeeShopDetailViewController {
        let viewController = CoffeeShopDetailViewController()
        viewController.presenter = CoffeeShopDetailModule.providesPresenter()
        viewController.coffeeShopId = coffeeShopId
        return viewController
    }
}
