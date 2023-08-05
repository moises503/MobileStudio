//
//  CoffeeShopItem+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

extension Array where Element == CoffeeShopItem {
    
    func toCoffeeShopList() -> [CoffeeShop] {
        return CoffeeShopItemToCoffeeShopMapper().transformCollection(values: self)
    }
}
