//
//  LocationDaoProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import CoreData

protocol LocationDaoProtocol {
    func insert(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void)
    func update(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void)
    func delete(using locationEntity: LocationEntity, withResult: @escaping (LocationSingleResult) -> Void)
    func list(filtering withPredicate: NSPredicate?,
              andSorting byProperties: [NSSortDescriptor]?,
              withResult: @escaping (LocationComposedResult) -> Void)
}
