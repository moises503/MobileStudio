//
//  File.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

protocol CoffeeShopDetailViewProtocol: AnyObject {
    func showError(with message: String)
    func showDetail(using coffeeDetail: CoffeeDetail)
}
