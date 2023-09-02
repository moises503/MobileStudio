//
//  LocationComposedResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation

enum LocationComposedResult {
    case success([LocationEntity])
    case error(CoffeeAppError)
}
