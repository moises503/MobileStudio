//
//  CoffeeDetailResponse.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

struct CoffeeDetailResponse: Codable {
    var title: String
    var description: String
    var location: CoffeeDetailLocationItem
    var products: [CoffeeDetailProductItem]
    
    enum Keys: CodingKey {
        case title
        case description
        case location
        case products
    }
}
