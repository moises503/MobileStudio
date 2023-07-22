//
//  LocationToLocationStringMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class LocationToLocationStrinMapper: Mapper<Location, String> {
    
    override func transform(value: Location) -> String {
        return "\(value.address) \(value.city) \(value.province)"
    }
}
