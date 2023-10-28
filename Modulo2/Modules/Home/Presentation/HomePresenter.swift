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
    private var tokenProvider: FirebaseTokenProviderProtocol
    
    init(locationProvider: LocationProviderProtocol, homeRepository: HomeRepositoryProtocol, tokenProvider: FirebaseTokenProviderProtocol) {
        self.locationProvider = locationProvider
        self.homeRepository = homeRepository
        self.tokenProvider = tokenProvider
    }
    
    func attachView(view: HomeViewProtocol) {
        self.view = view
    }
    
    func initialize() {
        tokenProvider.obtainFirebaseToken { tokenResult in
            switch tokenResult {
            case .success(let token):
                debugPrint("TOKEN: \(token)")
            case .error(let error):
                debugPrint("TOKEN_ERROR: \(error)")
            }
        }
    }
    
    func resolveDefaultLocation() {
        locationProvider.getFavoriteLocation { [weak self] locationProviderResult in
            switch(locationProviderResult) {
            case .success(let favoriteLocation):
                if let favoriteLocation = favoriteLocation {
                    self?.view?.showDefaultLocation(with: favoriteLocation)
                } else {
                    self?.view?.requestLocation()
                }
            case .error(_):
                self?.view?.requestLocation()
            }
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
