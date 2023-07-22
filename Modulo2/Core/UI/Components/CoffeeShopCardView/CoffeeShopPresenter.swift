//
//  CoffeeShopPresenter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class CoffeeShopPresenter : CoffeeShopPresenterProtocol {
    private weak var view: CoffeeShopViewProtocol?
    
    func attachView(view: CoffeeShopViewProtocol) {
        self.view = view
    }
    
    func renderCoffeeShopView(using coffeeShopView: CoffeeShopView?) {
        guard let coffeeShopView = coffeeShopView else {
            return
        }
        view?.displayCoffeeShopView(with: coffeeShopView)
        checkIfFavorite(using: coffeeShopView)
        checkServicesAvailable(using: coffeeShopView)
    }
    
    private func checkIfFavorite(using coffeeShopView: CoffeeShopView) {
        if coffeeShopView.isFavorite {
            view?.markAsFavorite()
        } else {
            view?.markAsNonFavorite()
        }
    }
    
    private func checkServicesAvailable(using coffeeShopView: CoffeeShopView) {
        let services: [CoffeeShopServices] = coffeeShopView.services 
        services.forEach { service in
            switch service {
            case .petFriendly:
                view?.petFriendlyAvalaible()
            case .coffee:
                view?.coffeeAvailable()
            case .backery:
                view?.bakeryAvailable()
            case .wifi:
                view?.wifiAvailbale()
            }
        }
    }
}
