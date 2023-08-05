//
//  LocationChooserRepositoryProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

protocol LocationChooserRepositoryProtocol {
    func obtainLocationsSaved() -> [Location]
}