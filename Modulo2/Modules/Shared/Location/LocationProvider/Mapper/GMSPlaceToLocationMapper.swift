//
//  CLLocationCoordinate2DToLocationMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import GooglePlaces

class GMSPlaceToLocationMapper: Mapper<GMSPlace, Location> {
    
    override func transform(value: GMSPlace) -> Location {
        return Location(address: value.formattedAddress ?? "",
                        city: value.getCity(),
                        province: value.getProvince(),
                        latitude: value.coordinate.latitude,
                        longitude: value.coordinate.longitude
        )
    }
}
