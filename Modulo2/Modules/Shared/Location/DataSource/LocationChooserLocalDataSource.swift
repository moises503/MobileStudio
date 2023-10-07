//
//  LocationChooserLocalDataSource.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation
import CoreData

class LocationChooserLocalDataSource: LocationChooserLocalDataSourceProtocol {
    
    private var locationDao: LocationDaoProtocol
    
    init(locationDao: LocationDaoProtocol) {
        self.locationDao = locationDao
    }
    
    func obtainLocationsSaved(onLocationObtained: @escaping (LocationObtainedResult) -> Void) {
        locationDao.list(filtering: nil, andSorting: [NSSortDescriptor(key: "isFavorite", ascending: false)]) { locationComposedResult in
            switch(locationComposedResult) {
            case .success(let locationEntityList):
                onLocationObtained(.success(locationEntityList.toLocationList()))
            case .error(let error):
                onLocationObtained(.error(error))
            }
        }
    }
    
    func saveLocation(with locationObtained: Location, onLocationSaved: @escaping (LocationSavedResult) -> Void) {
        var mutableLocationObtained = locationObtained
        mutableLocationObtained.isFavorite = true
        locationDao.update(using: mutableLocationObtained.toLocationEntity()) { locationSingleResult in
            switch locationSingleResult {
            case .success(let locationSaved):
                if let locationSaved = locationSaved {
                    onLocationSaved(.success(locationSaved.toLocation()))
                } else {
                    onLocationSaved(.error(CoffeeAppError.databaseError("Couldn't save your location")))
                }
            case .error(let coffeeAppError):
                onLocationSaved(.error(coffeeAppError))
            }
        }
    }
}
