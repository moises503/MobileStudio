//
//  LocationManagerLocalizable.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

class LocationManagerLocalizable: LocalizableProtocol {
    static var localizableFileName: String = "LocationManagerLocalizable"
    
    static let locationManagerAuthorizeWhenInUse = "location_manager_authorize_when_in_use".localized(with: localizableFileName)
    static let locationManagerDenied = "location_manager_denied".localized(with: localizableFileName)
    static let locationManagerNotDetermined = "location_manager_not_determined".localized(with: localizableFileName)
    static let locationManagerRestricted = "location_manager_restricted".localized(with: localizableFileName)
    static let locationManagerAuthorizedAlways = "location_manager_authorized_always".localized(with: localizableFileName)
}
