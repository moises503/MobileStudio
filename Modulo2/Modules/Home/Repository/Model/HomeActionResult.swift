//
//  ServiceResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

enum HomeActionResult {
    case success([CoffeeShop])
    case error(CoffeeAppError)
}
