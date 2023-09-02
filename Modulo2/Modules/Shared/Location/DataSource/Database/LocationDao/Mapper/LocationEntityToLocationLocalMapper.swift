//
//  LocationEntityToLocationLocalMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import CoreData


class LocationEntityToLocationLocalMapper: Mapper<LocationEntity, NSEntityDescription?> {
    
    private var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    override func transform(value: LocationEntity) -> NSEntityDescription? {
        let entity = NSEntityDescription.entity(forEntityName: "LocationLocal", in: managedContext)
        entity?.setValue(value.address, forKey: LocationLocalProperties.address.rawValue)
        entity?.setValue(value.city, forKey: LocationLocalProperties.city.rawValue)
        entity?.setValue(value.province, forKey: LocationLocalProperties.province.rawValue)
        entity?.setValue(value.latitude, forKey: LocationLocalProperties.latitude.rawValue)
        entity?.setValue(value.longitude, forKey: LocationLocalProperties.longitude.rawValue)
        entity?.setValue(value.isFavorite, forKey: LocationLocalProperties.isFavorite.rawValue)
        return entity
    }
    
    enum LocationLocalProperties: String {
        case address
        case city
        case province
        case latitude
        case longitude
        case isFavorite
    }
}
