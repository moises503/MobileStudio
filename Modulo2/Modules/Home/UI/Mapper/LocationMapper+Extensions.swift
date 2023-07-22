//
//  LocationMapper+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

extension Location {
    
    func toLocationString() -> String {
        return LocationToLocationStrinMapper().transform(value: self)
    }
}
