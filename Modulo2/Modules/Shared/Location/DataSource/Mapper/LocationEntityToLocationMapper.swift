//
//  LocationEntityToLocationMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 26/08/23.
//

import Foundation

class LocationEntityToLocationMapper: Mapper<LocationEntity, Location> {
    
    override func transform(value: LocationEntity) -> Location {
        return Location(address: value.address, city: value.city, province: value.province, latitude: value.latitude, longitude: value.longitude, isFavorite: value.isFavorite)
    }
    
    override func reverseTransform(value: Location) -> LocationEntity {
        return LocationEntity(address: value.address, city: value.city, province: value.province, latitude: value.latitude, longitude: value.longitude, isFavorite: value.isFavorite)
    }
}
