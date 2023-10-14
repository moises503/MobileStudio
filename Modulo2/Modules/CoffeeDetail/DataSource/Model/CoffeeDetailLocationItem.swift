//
//  CoffeeDetailLocationItem.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

struct CoffeeDetailLocationItem: Codable {
    var latitude: Double
    var longitude: Double
    
    enum Keys: CodingKey {
        case latitude
        case longitude
    }
}
