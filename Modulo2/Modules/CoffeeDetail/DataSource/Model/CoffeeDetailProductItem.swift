//
//  CoffeeDetailProductItem.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

struct CoffeeDetailProductItem: Codable {
    var title: String
    var description: String
    
    enum Keys: CodingKey {
        case title
        case description
    }
}
