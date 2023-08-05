//
//  CoffeeShop+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

extension Array where Element == String {
    
    func toCoffeeShopServicesList() -> [CoffeeShopServices] {
        return StringToCoffeeShopServiceMapper().transformCollection(values: self)
    }
}

extension Array where Element == CoffeeShop {
    
    func toCoffeeShopViewList() -> [CoffeeShopView] {
        return CoffeeShopToCoffeeShopViewMapper().transformCollection(values: self)
    }
}
