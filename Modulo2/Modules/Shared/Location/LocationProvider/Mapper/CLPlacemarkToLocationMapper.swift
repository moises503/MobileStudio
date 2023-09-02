//
//  CLLocationToLocationMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import CoreLocation

class CLPlacemarkToLocationMapper: Mapper<CLPlacemark, Location> {
    
    override func transform(value: CLPlacemark) -> Location {
        return Location(address: "\(value.thoroughfare ?? "") \(value.postalCode ?? "") \(value.locality ?? "") \(value.administrativeArea ?? "")",
                        city: value.locality ?? "",
                        province: value.administrativeArea ?? "",
                        latitude: value.location?.coordinate.latitude ?? 0.0,
                        longitude: value.location?.coordinate.longitude ?? 0.0
        )
    }
}
