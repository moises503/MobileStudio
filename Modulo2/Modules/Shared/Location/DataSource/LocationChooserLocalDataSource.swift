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
        locationDao.list(filtering: nil, andSorting: nil) { locationComposedResult in
            switch(locationComposedResult) {
            case .success(let locationEntityList):
                onLocationObtained(.success(locationEntityList.toLocationList()))
            case .error(let error):
                onLocationObtained(.error(error))
            }
        }
    }
}
