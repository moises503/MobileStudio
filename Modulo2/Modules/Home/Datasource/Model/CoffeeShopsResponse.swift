//
//  CoffeeShopsResponse.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

struct CoffeeShopsReponse : Codable {
    var shops: [CoffeeShopItem]
    var error: String?
    
    enum Keys: String, CodingKey {
        case shops
        case error
    }
    
    /*
     {
        "shops": [
            {
                 "id": "379837495",
                 "name": "Pico café",
                 "address": "Artz 1509",
                 "imageURL": "https://image.io/image.png",
                 "isFavorite": false,
                 "latitude": 13243.4843934,
                 "longitude": 12.898494,
                 "services": [
                     "petFriendly", "wifi", "bakery"
                 ]
            }
        ],
        "error": null
     }
     
     */
}
