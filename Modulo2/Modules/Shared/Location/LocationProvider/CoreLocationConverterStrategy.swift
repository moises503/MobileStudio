//
//  CoreLocationConverterStrategy.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import CoreLocation
import GooglePlaces

class CoreLocationConverterStrategy: LocationConverterStrategyProtocol {
    
    func resolveLocation(with location: Coordinate, completion: @escaping ((Location?) -> Void)) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location.toCLLocation(), preferredLocale: .current, completionHandler: { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            completion(place.toLocation())
        })
    }
}
