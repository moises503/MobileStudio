//
//  Location+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 26/08/23.
//

import Foundation


extension Array where Element == LocationEntity {
    
    func toLocationList() -> [Location] {
        return LocationEntityToLocationMapper().transformCollection(values: self)
    }
}

extension LocationEntity {
    
    func toLocation() -> Location {
        return LocationEntityToLocationMapper().transform(value: self)
    }
}

extension Location {
    
    func toLocationEntity() -> LocationEntity {
        return LocationEntityToLocationMapper().reverseTransform(value: self)
    }
}
