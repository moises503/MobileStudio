//
//  CLLocationToCoordinateMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import CoreLocation

class CLLocationToCoordinateMapper: Mapper<CLLocation, Coordinate> {
    
    override func transform(value: CLLocation) -> Coordinate {
        return Coordinate(latitude: value.coordinate.latitude, longitude: value.coordinate.longitude)
    }
    
    override func reverseTransform(value: Coordinate) -> CLLocation {
        return CLLocation(latitude: value.latitude, longitude: value.longitude)
    }
}
