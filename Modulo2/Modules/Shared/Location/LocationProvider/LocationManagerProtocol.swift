//
//  LocationManagerProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

protocol LocationManagerProtocol {
    func recoverLocation(onLocationObtained: @escaping (Coordinate) -> Void)
    func verifyLocationPermission(onPermissionResult: @escaping (LocationPermissionResult) -> Void)
}
