//
//  CLLocationCoordinate2DToLocationMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import GoogleMaps
import GooglePlaces

class GMSAddressToLocationMapper: Mapper<GMSAddress, Location> {
    
    override func transform(value: GMSAddress) -> Location {
        return Location(address: "\(value.thoroughfare ?? "") \(value.postalCode ?? "") \(value.locality ?? "") \(value.administrativeArea ?? "")",
                        city: value.locality ?? "",
                        province: value.administrativeArea ?? "",
                        latitude: value.coordinate.latitude,
                        longitude: value.coordinate.longitude
        )
    }
}
