//
//  HomeModule.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class HomeModule {
    
    static func providesEndPoint() -> CoffeeShopsEndPointProtocol {
        return CoffeeShopsEndPoint(networkManager: NetworkManager.shared)
    }
    
    static func providesDataSource() -> HomeDataSourceProtocol {
        return HomeDataSource(endPoint: providesEndPoint())
    }
    
    static func providesRepository() -> HomeRepositoryProtocol {
        return HomeRepository(dataSource: providesDataSource())
    }
    
    static func providesPresenter() -> HomePresenterProtocol {
        return HomePresenter(
            locationProvider: LocationChooserModule.providesLocationProvider(),
            homeRepository: providesRepository()
        )
    }
}
