//
//  CLLocation+Extension.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import CoreLocation
import GoogleMaps
import GooglePlaces

extension CLPlacemark {
    
    func toLocation() -> Location {
        return CLPlacemarkToLocationMapper().transform(value: self)
    }
}

extension GMSAddress {
    
    func toLocation() -> Location {
        return GMSAddressToLocationMapper().transform(value: self)
    }
}


extension CLLocation {
    
    func toCoordinate() -> Coordinate {
        return CLLocationToCoordinateMapper().transform(value: self)
    }
}

extension Coordinate {
    
    func toCLLocation() -> CLLocation {
        return CLLocationToCoordinateMapper().reverseTransform(value: self)
    }
}
