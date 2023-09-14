//
//  LocationChoosePresenter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationChooserPresenter: LocationChooserPresenterProtocol {
    
    private weak var view: LocationChooserViewProtocol?
    private var repository: LocationChooserRepositoryProtocol
    
    init(repository: LocationChooserRepositoryProtocol) {
        self.repository = repository
    }
    
    func attachView(view: LocationChooserViewProtocol) {
        self.view = view
    }
    
    func obtainLocationsSaved() {
        repository.obtainLocationsSaved { [weak self] onLocationObtainedResult in
            switch(onLocationObtainedResult) {
            case .success(let locations):
                if locations.isEmpty {
                    self?.view?.showEmptyLocations()
                } else {
                    self?.view?.showLocationsSaved(with: locations)
                }
            case .error(let error):
                self?.view?.showError(with: error.localizedDescription)
            }
        }
    }
    
    func saveLocationObtained(with location: Location) {
        repository.saveLocation(with: location) { [weak self] locationSavedResult in
            switch locationSavedResult {
            case .success(let locationSaved):
                self?.view?.locationSaved(with: locationSaved)
            case .error(let coffeeAppError):
                self?.view?.showError(with: coffeeAppError.localizedDescription)
            }
        }
    }
    
    func resolveLocationPermission(with locationResult: LocationPermissionResult) {
        switch locationResult {
        case .success(let locationStatus):
            switch locationStatus.status {
            case .authorizedAlways:
                view?.proceedToRequestLocation()
            case .denied:
                view?.permissionDenied()
            case .request:
                view?.proceedToRequestLocation()
            case .notDetermined:
                view?.proceedToRequestLocation()
            }
        case .error(let error):
            view?.showError(with: error.localizedDescription)
        }
    }
}
