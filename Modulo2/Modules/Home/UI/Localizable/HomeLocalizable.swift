//
//  HomeLocalizable.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

class HomeLocalizable: LocalizableProtocol {
    static var localizableFileName: String = "HomeLocalizable"
    
    static let homeSreenTitle = "home_screen_title".localized(with: localizableFileName)
    static let homeFindLocationTitle = "home_find_location_title".localized(with: localizableFileName)
}
