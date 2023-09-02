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
}
