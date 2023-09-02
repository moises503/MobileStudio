//
//  CoffeAppError.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

enum CoffeeAppError: Error {
    case requestError(String)
    case networkError(String)
    case databaseError(String)
    case permissionError(String)
}
