//
//  HomeRouter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomeRouter : HomeRouterProtocol {
    
    static func launch() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.presenter = HomeModule.providesPresenter()
        viewController.locationManager = LocationManagerModule.providesLocationManager()
        viewController.locationConverter = LocationManagerModule.providesCoreLocationConverterStrategy()
        return viewController
    }
}
