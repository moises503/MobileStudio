//
//  LocationDbResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation


enum LocationSingleResult {
    case success(LocationEntity?)
    case error(CoffeeAppError)
}
