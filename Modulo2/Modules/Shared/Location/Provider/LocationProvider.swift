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
    
    func getFavoriteLocation(withResult: @escaping (LocationProviderResult) -> Void) {
        repository.obtainLocationsSaved { onLocationObtainedResult in
            switch(onLocationObtainedResult) {
            case .success(let locations):
                withResult(.success(locations.first))
            case .error(let error):
                withResult(.error(error))
            }
        }
    }
}
