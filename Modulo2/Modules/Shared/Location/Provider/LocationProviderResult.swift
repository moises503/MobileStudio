//
//  LocationProviderResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 26/08/23.
//

import Foundation

enum LocationProviderResult {
    case success(Location?)
    case error(CoffeeAppError)
}
