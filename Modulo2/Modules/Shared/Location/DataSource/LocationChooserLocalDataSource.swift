//
//  LocationChooserLocalDataSource.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationChooserLocalDataSource: LocationChooserLocalDataSourceProtocol {
    
    func obtainLocationsSaved() -> [Location] {
        return makeInMemoryLocations()
    }
    
    private func makeInMemoryLocations() -> [Location] {
        var locations: [Location] = []
        locations.append(Location(address: "Nápoles 1123", city: "Mexico", province: "Mexico", latitude: 98.99078585, longitude: -89.85499, isFavorite: true))
        locations.append(Location(address: "Roma norte 123", city: "Mexico", province: "Mexico", latitude: 98.99078586, longitude: -89.854989))
        locations.append(Location(address: "Mazaric 394", city: "Mexico", province: "Mexico", latitude: 98.99078587, longitude: -89.85491))
        locations.append(Location(address: "Artz 980", city: "Mexico", province: "Mexico", latitude: 98.99078588, longitude: -89.85490))
        return locations
    }
}
