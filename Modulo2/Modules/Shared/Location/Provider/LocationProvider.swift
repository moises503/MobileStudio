//
//  LocationProvider.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationProvider: LocationProviderProtocol {
    
    private var repository: LocationChooserRepositoryProtocol
    
    init(repository: LocationChooserRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavoriteLocation() -> Location? {
        let locations = repository.obtainLocationsSaved()
        
        return locations.first { location in
            location.isFavorite == true
        }
    }
}
