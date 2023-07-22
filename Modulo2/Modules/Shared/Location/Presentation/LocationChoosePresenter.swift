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
        let locations = repository.obtainLocationsSaved()
        
        if locations.isEmpty {
            view?.showEmptyLocations()
        } else {
            view?.showLocationsSaved(with: locations)
        }
    }
}
