//
//  LocationEntityToLocationLocalMapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import CoreData


class LocationEntityToLocationLocalMapper: Mapper<LocationEntity, NSManagedObject?> {
    
    private var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    override func transform(value: LocationEntity) -> NSManagedObject? {
        let entity = NSEntityDescription.entity(forEntityName: "LocationLocal", in: managedContext)
        guard let entity = entity else {
            return nil
        }
        let location = NSManagedObject(entity: entity, insertInto: managedContext)
        location.setValue(value.address, forKey: LocationLocalProperties.address.rawValue)
        location.setValue(value.city, forKey: LocationLocalProperties.city.rawValue)
        location.setValue(value.province, forKey: LocationLocalProperties.province.rawValue)
        location.setValue(value.latitude, forKey: LocationLocalProperties.latitude.rawValue)
        location.setValue(value.longitude, forKey: LocationLocalProperties.longitude.rawValue)
        location.setValue(value.isFavorite, forKey: LocationLocalProperties.isFavorite.rawValue)
        return location
    }
    
    enum LocationLocalProperties: String {
        case address = "address"
        case city = "city"
        case province = "province"
        case latitude = "latitude"
        case longitude = "longitude"
        case isFavorite = "isFavorite"
    }
}
