//
//  CoffeeDetailResponse+Extension.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

extension CoffeeDetailResponse {
    
    func toCoffeeDetail() -> CoffeeDetail {
        return CoffeeDetailResponseToCoffeeDetailMapper().transform(value: self)
    }
}
