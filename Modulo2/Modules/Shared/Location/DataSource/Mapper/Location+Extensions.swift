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
