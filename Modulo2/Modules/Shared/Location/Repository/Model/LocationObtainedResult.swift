//
//  LocationResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

enum LocationObtainedResult {
    case success([Location])
    case error(CoffeeAppError)
}
