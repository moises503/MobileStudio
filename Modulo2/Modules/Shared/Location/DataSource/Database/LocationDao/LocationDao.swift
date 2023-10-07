//
//  LocationDao.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import CoreData

class LocationDao: LocationDaoProtocol {
    
    private var managedContext: NSManagedObjectContext
    
    init() {
        self.managedContext = LocationDatabase.shared.persistentContainer.viewContext
    }
    
    func insert(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void) {
        do {
            if let _ = locationEntity.toNSEntityDescription(managedContext: managedContext) {
                try managedContext.save()
                withResult(.success(locationEntity))
            } else {
                withResult(.error(.databaseError("Cannot save your location")))
            }
        } catch {
            debugPrint("Error when insert information: \(error)")
            withResult(.error(.databaseError(error.localizedDescription)))
        }
    }
    
    func update(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void) {
        listLocationLocalElements(filtering: NSPredicate(format: "address = %@", locationEntity.address), andSorting: [NSSortDescriptor(key: "isFavorite", ascending: false)]) { [unowned self] locationComposedResult in
            switch(locationComposedResult) {
            case .success(let locationEntities):
                let locationToUpdate: LocationLocal? = locationEntities.filter { locationFiltered in
                    locationFiltered.latitude == locationEntity.latitude && locationFiltered.longitude == locationEntity.longitude
                }.first
                if let locationToUpdate = locationToUpdate {
                    /// We must have only one favorite location other locations excluding this one must be non-favorite
                    if locationEntity.isFavorite {
                        self.markLocationAsNonFavorite { locationMarkAsNonFavoriteResult in
                            switch(locationMarkAsNonFavoriteResult) {
                            case .success:
                                self.updateLocationEntity(using: locationEntity, andLocationLocal: locationToUpdate) { locationUpdateResult in
                                    switch(locationUpdateResult) {
                                    case .success(let locationEntity):
                                        withResult(.success(locationEntity))
                                    case .error(let error):
                                        withResult(.error(error))
                                    }
                                }
                            case .error(let error):
                                withResult(.error(error))
                            }
                        }
                    } else {
                        self.updateLocationEntity(using: locationEntity, andLocationLocal: locationToUpdate) { locationUpdateResult in
                            switch(locationUpdateResult) {
                            case .success(let locationEntity):
                                withResult(.success(locationEntity))
                            case .error(let error):
                                withResult(.error(error))
                            }
                        }
                    }
                } else {
                    self.insert(using: locationEntity) { locationSingleResult in
                        switch(locationSingleResult) {
                        case .success(let locationEntity):
                            withResult(.success(locationEntity))
                        case .error(let error):
                            withResult(.error(error))
                        }
                    }
                }
            case .error(let error):
                withResult(.error(error))
            }
        }
    }
    
    func delete(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void) {
        listLocationLocalElements(filtering: NSPredicate(format: "latitude = %d AND longitude = %d", locationEntity.latitude, locationEntity.longitude), andSorting: nil) { [unowned self] locationLocalListResult in
            switch(locationLocalListResult) {
            case .success(let locationLocalList):
                if let locationLocal: LocationLocal = locationLocalList.first {
                    do {
                        self.managedContext.delete(locationLocal)
                        try self.managedContext.save()
                    } catch {
                        debugPrint("Cannot delete location: \(error)")
                        withResult(.error(.databaseError(error.localizedDescription)))
                    }
                } else {
                    withResult(.error(.databaseError("Location not found")))
                }
            case .error(let error):
                withResult(.error(error))
            }
        }
    }
    
    func list(filtering withPredicate: NSPredicate?,
              andSorting byProperties: [NSSortDescriptor]?,
              withResult: @escaping (LocationComposedResult) -> Void) {
        listLocationLocalElements(filtering: withPredicate, andSorting: byProperties) { locationLocalListResult in
            switch(locationLocalListResult) {
            case .success(let locationLocalList):
                withResult(.success(locationLocalList.toLocationEntityList()))
            case .error(let error):
                withResult(.error(error))
            }
        }
    }
    
    private func markLocationAsNonFavorite(withResult: @escaping (LocationLocalNonFavoritesResult) -> Void) {
        listLocationLocalElements(filtering: nil, andSorting: [NSSortDescriptor(key: "isFavorite", ascending: false)]) { [unowned self] locationLocalListResult in
            switch(locationLocalListResult) {
            case .success(let locationLocalList):
                locationLocalList.forEach { locationLocal in
                    locationLocal.isFavorite = false
                }
                do {
                    try self.managedContext.save()
                    withResult(.success)
                } catch {
                    debugPrint("Cannot mark all locations as non-favorite: \(error)")
                    withResult(.error(.databaseError(error.localizedDescription)))
                }
            case .error(let error):
                withResult(.error(error))
            }
        }
    }
    
    private func updateLocationEntity(using locationEntity: LocationEntity, andLocationLocal: LocationLocal, withResult: @escaping (LocationUpdateResult) -> Void) {
        andLocationLocal.address = locationEntity.address
        andLocationLocal.city = locationEntity.city
        andLocationLocal.province = locationEntity.province
        andLocationLocal.latitude = locationEntity.latitude
        andLocationLocal.longitude = locationEntity.longitude
        andLocationLocal.isFavorite = locationEntity.isFavorite
        do {
            try managedContext.save()
            withResult(.success(locationEntity))
        } catch {
            debugPrint("Cannot update current location entity: \(locationEntity)")
            withResult(.error(.databaseError(error.localizedDescription)))
        }
    }
    
    
    private func listLocationLocalElements(
        filtering withPredicate: NSPredicate?,
        andSorting byProperties: [NSSortDescriptor]?,
        withResult: @escaping (LocationLocalListResult) -> Void
    ) {
        let fetchRequest  = NSFetchRequest<LocationLocal>(entityName: "LocationLocal")
        if let withPredicate = withPredicate {
            fetchRequest.predicate = withPredicate
        }
        if let byProperties = byProperties {
            fetchRequest.sortDescriptors = byProperties
        }
        do {
            let allLocations: [LocationLocal] = try managedContext.fetch(fetchRequest)
            withResult(.success(allLocations))
        } catch {
            debugPrint("Error retrieving locations: \(error)")
            withResult(.error(.databaseError(error.localizedDescription)))
        }
    }
    
    enum LocationLocalNonFavoritesResult {
        case success
        case error(CoffeeAppError)
    }
    
    enum LocationLocalListResult {
        case success([LocationLocal])
        case error(CoffeeAppError)
    }
    
    enum LocationUpdateResult {
        case success(LocationEntity)
        case error(CoffeeAppError)
    }
}
