//
//  LocationPermissionResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

enum LocationPermissionResult {
    case success(LocationStatus)
    case error(CoffeeAppError)
}
