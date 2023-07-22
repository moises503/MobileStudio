//
//  CoffeeShopsResponse.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

struct CoffeeShopsReponse : Codable {
    var coffeeShops: [CoffeeShopItem]
    var errorMessage: String?
    
    enum Keys: String, CodingKey {
        case coffeeShops = "shops"
        case errorMessage = "error"
    }
    
    /*
     {
        "shops": [
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
        ],
        "error": null
     }
     
     */
}
