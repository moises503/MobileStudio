//
//  LocationLocalToLocationEntityMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 26/08/23.
//

import Foundation
import CoreData

class LocationLocalToLocationEntityMapper: Mapper<LocationLocal, LocationEntity> {
    
    override func transform(value: LocationLocal) -> LocationEntity {
        return LocationEntity(address: value.address ?? "",
                              city: value.city ?? "",
                              province: value.province ?? "",
                              latitude: value.latitude ,
                              longitude: value.longitude
        )
    }
}
