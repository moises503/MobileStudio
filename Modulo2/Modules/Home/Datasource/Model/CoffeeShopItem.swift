//
//  CoffeeShopItem.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

struct CoffeeShopItem : Codable {
    var id: String
    var name: String
    var address: String
    var imageURL: String?
    var isFavorite: Bool
    var latitude: Double
    var longitude: Double
    var services: [String]
    
    enum Keys: String, CodingKey {
        case id
        case name
        case address
        case imageURL
        case isFavorite
        case latitude
        case longitude
        case services
    }
    
    /*
     {
        "_id": "379837495",
        "name": "Pico café",
        "address": "Artz 1509",
        "imageURL": "https://image.io/image.png",
        "is_favorite": false,
        "latitude": 13243.4843934,
        "longitude": 12.898494,
        "services": [
            "petFriendly", "wifi", "bakery"
        ]
     }
     
     */
}
