//
//  HomeModule.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomeModule {
    
    static func providesPresenter() -> HomePresenterProtocol {
        return HomePresenter(locationProvider: LocationChooserModule.providesLocationProvider())
    }
}
