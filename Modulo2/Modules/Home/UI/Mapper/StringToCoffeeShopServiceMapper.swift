//
//  StringToCoffeeShopServiceMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

class StringToCoffeeShopServiceMapper: Mapper<String, CoffeeShopServices> {
    
    override func transform(value: String) -> CoffeeShopServices {
        switch value {
        case "petFriendly":
            return .petFriendly
        case "bakery":
            return .backery
        case "coffee":
            return .coffee
        case "wifi":
            return .wifi
        default:
            return .other
        }
    }
}
