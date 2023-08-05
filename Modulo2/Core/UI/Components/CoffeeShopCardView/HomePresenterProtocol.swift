//
//  HomePresenterProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

protocol HomePresenterProtocol {
    func attachView(view: HomeViewProtocol)
    func resolveDefaultLocation()
    func obtainNearCoffeeShops(with locationParams: LocationParams)
}