//
//  LocationChooserRouter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation
import UIKit

class LocationChooserRouter: LocationChooserRouterProtocol {
    
    static func launch() -> LocationChooserViewController {
        let viewController = LocationChooserViewController()
        viewController.presenter = LocationChooserModule.providesPresenter()
        viewController.locationManager = LocationManagerModule.providesLocationManager()
        viewController.locationConverter = LocationManagerModule.providesCoreLocationConverterStrategy()
        return viewController
    }
}
