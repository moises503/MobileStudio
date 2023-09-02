//
//  GoogleLocationConverterStrategy.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import CoreLocation
import GoogleMaps
import GooglePlaces

class GoogleLocationConverterStrategy: LocationConverterStrategyProtocol {
    
    func resolveLocation(with location: Coordinate, completion: @escaping ((Location?) -> Void)) {
        let clLocation: CLLocation = location.toCLLocation()
        let coordinate: CLLocationCoordinate2D = clLocation.coordinate
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), error == nil else {
                completion(nil)
                return
            }
            completion(address.toLocation())
        }
    }
}
