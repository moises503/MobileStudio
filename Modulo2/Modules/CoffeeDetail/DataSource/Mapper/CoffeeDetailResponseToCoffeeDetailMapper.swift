//
//  CoffeeDetailResponseToCoffeeDetailMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeDetailResponseToCoffeeDetailMapper: Mapper<CoffeeDetailResponse, CoffeeDetail> {
    
    override func transform(value: CoffeeDetailResponse) -> CoffeeDetail {
        return CoffeeDetail(
            title: value.title,
            description: value.description,
            location: CoffeeLocation(latitude: value.location.latitude, longitude: value.location.longitude),
            products: value.products.map({ productItem in
                return CoffeeProduct(title: productItem.title, description: productItem.description)
            })
        )
    }
}
