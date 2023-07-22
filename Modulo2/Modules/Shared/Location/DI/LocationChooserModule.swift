//
//  LocationChooserModule.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationChooserModule {
    
    static func providesDataSource() -> LocationChooserLocalDataSourceProtocol {
        return LocationChooserLocalDataSource()
    }
    
    static func providesRepository() -> LocationChooserRepositoryProtocol {
        return LocationChooserRepository(dataSource: providesDataSource())
    }
    
    static func providesPresenter() -> LocationChooserPresenterProtocol {
        return LocationChooserPresenter(repository: providesRepository())
    }
    
    static func providesLocationProvider() -> LocationProviderProtocol {
        return LocationProvider(repository: providesRepository())
    }
}
