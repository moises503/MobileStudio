//
//  CoffeeShopToCoffeeShopViewMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

class CoffeeShopToCoffeeShopViewMapper: Mapper<CoffeeShop, CoffeeShopView> {
    
    override func transform(value: CoffeeShop) -> CoffeeShopView {
        return CoffeeShopView(
            id: value.id,
            name: value.name,
            address: value.address,
            imageURL: value.imageURL,
            isFavorite: value.isFavorite,
            services: value.services.toCoffeeShopServicesList()
        )
    }
}
