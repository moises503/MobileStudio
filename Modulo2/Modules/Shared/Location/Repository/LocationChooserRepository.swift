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
    
    func obtainLocationsSaved() -> [Location] {
        return dataSource.obtainLocationsSaved()
    }
}