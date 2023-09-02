//
//  LocationConverterProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 02/09/23.
//

import Foundation

protocol LocationConverterStrategyProtocol {
    func resolveLocation(with location: Coordinate, completion: @escaping ((Location?) -> Void))
}
