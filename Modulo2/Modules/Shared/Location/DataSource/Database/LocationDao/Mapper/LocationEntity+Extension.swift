//
//  LocationEntity+Extension.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 26/08/23.
//

import Foundation
import CoreData

extension LocationEntity {
    
    func toNSEntityDescription(managedContext: NSManagedObjectContext) -> NSEntityDescription? {
        return LocationEntityToLocationLocalMapper(managedContext: managedContext).transform(value: self)
    }
}


extension Array where Element == LocationLocal {
    
    func toLocationEntityList() -> [LocationEntity] {
        return LocationLocalToLocationEntityMapper().transformCollection(values: self)
    }
}
