//
//  LocationChooserViewProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

protocol LocationChooserViewProtocol: AnyObject {
    func showEmptyLocations()
    func showLocationsSaved(with locationList: [Location])
    func showError(with message: String)
    
    /// To request location permission
    func permissionDenied()
    func proceedToRequestLocation()
}
