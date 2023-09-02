//
//  LocationDatabase.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import CoreData

class LocationDatabase {

    private init() {
    }

    static let shared = LocationDatabase()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocationDb")
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()
}
