//
//  LocationChooserRepository.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationChooserRepository: LocationChooserRepositoryProtocol {
    
    private var dataSource: LocationChooserLocalDataSourceProtocol
    
    init(dataSource: LocationChooserLocalDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func obtainLocationsSaved(onLocationObtained: @escaping (LocationObtainedResult) -> Void) {
        dataSource.obtainLocationsSaved { onLocationObtainedResult in
            onLocationObtained(onLocationObtainedResult)
        }
    }
    
    func saveLocation(with locationObtained: Location, onLocationSaved: @escaping (LocationSavedResult) -> Void) {
        dataSource.saveLocation(with: locationObtained, onLocationSaved: onLocationSaved)
    }
}
