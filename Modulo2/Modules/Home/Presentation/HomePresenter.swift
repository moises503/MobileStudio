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
    
    init(locationProvider: LocationProviderProtocol) {
        self.locationProvider = locationProvider
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
}
