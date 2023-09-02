//
//  GMSPlace+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation
import GooglePlaces


extension GMSPlace  {
    
    func getCity() -> String {
        var city = ""
        guard let addressComponents = addressComponents else {
            return ""
        }
        addressComponents.forEach { component in
            let types = component.types
            if types.contains("locality") {
                city = component.name
            }
        }
        return city
    }
    
    func getProvince() -> String {
        var province = ""
        guard let addressComponents = addressComponents else {
            return ""
        }
        addressComponents.forEach { component in
            let types = component.types
            if types.contains("administrative_area_level_1") {
                province =  component.name
            }
        }
        return province
    }
}
