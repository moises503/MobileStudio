//
//  LocationProviderModule.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 11/09/23.
//

import Foundation

class LocationManagerModule {
    
    static func providesLocationManager() -> LocationManagerProtocol {
        return LocationManager()
    }
    
    static func providesCoreLocationConverterStrategy() -> LocationConverterStrategyProtocol {
        return CoreLocationConverterStrategy()
    }
}
