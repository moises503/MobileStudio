//
//  LocationManaged.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import GoogleMaps
import GooglePlaces
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {
    
    
    private let manager = CLLocationManager()
    private var onLocationObtained: ((Coordinate) -> Void)?
    
    func recoverLocation(onLocationObtained: @escaping (Coordinate) -> Void) {
        self.onLocationObtained = onLocationObtained
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func verifyLocationPermission(onPermissionResult: @escaping (LocationPermissionResult) -> Void) {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14, *) {
            authorizationStatus = manager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        switch authorizationStatus {
        case .authorizedWhenInUse:
            onPermissionResult(.success(LocationStatus(messageDescription: LocationManagerLocalizable.locationManagerAuthorizeWhenInUse, status: .request)))
        case .denied:
            onPermissionResult(.success(LocationStatus(messageDescription: LocationManagerLocalizable.locationManagerDenied, status: .denied)))
        case .notDetermined:
            onPermissionResult(.success(LocationStatus(messageDescription: LocationManagerLocalizable.locationManagerNotDetermined, status: .denied)))
        case .restricted:
            onPermissionResult(.success(LocationStatus(messageDescription: LocationManagerLocalizable.locationManagerRestricted, status: .denied)))
        case .authorizedAlways:
            onPermissionResult(.success(LocationStatus(messageDescription: LocationManagerLocalizable.locationManagerAuthorizedAlways, status: .authorizedAlways)))
        @unknown default:
            onPermissionResult(.error(.permissionError("Permission not available")))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        onLocationObtained?(location.toCoordinate())
        manager.stopUpdatingLocation()
    }
}
