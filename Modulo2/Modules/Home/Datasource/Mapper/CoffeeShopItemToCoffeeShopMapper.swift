//
//  CoffeeShopItemToCoffeeShopMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

class CoffeeShopItemToCoffeeShopMapper: Mapper<CoffeeShopItem, CoffeeShop> {
    
    override func transform(value: CoffeeShopItem) -> CoffeeShop {
        return CoffeeShop(
            id: value.id,
            name: value.name,
            address: value.address,
            imageURL: value.imageURL,
            isFavorite: value.isFavorite,
            latitude: value.latitude,
            longitude: value.longitude,
            services: value.services
        )
    }
}
