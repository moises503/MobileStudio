//
//  HomePresenter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private var locationProvider: LocationProviderProtocol
    private var homeRepository: HomeRepositoryProtocol
    
    init(locationProvider: LocationProviderProtocol, homeRepository: HomeRepositoryProtocol) {
        self.locationProvider = locationProvider
        self.homeRepository = homeRepository
    }
    
    func attachView(view: HomeViewProtocol) {
        self.view = view
    }
    
    func resolveDefaultLocation() {
        if let favoriteLocation = locationProvider.getFavoriteLocation() {
            view?.showDefaultLocation(with: favoriteLocation)
        } else {
            view?.requestLocation()
        }
    }
    
    func obtainNearCoffeeShops(with locationParams: LocationParams) {
        homeRepository.obtainNearCoffeeShops(with: locationParams) { [weak self] homeActionResult in
            switch homeActionResult {
            case .success(let coffeeShops):
                self?.view?.showCoffeeShops(with: coffeeShops)
            case .error(let error):
                self?.view?.showError(message: error.localizedDescription)
            }
        }
    }
}
