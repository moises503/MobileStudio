//
//  Mapper.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import Foundation

class Mapper<T1, T2> {
    
    func transform(value : T1) -> T2 {
        preconditionFailure("This method should be implemented")
    }
    
    func reverseTransform(value : T2) -> T1 {
        preconditionFailure("This method should be implemented")
    }
    
    func transformCollection(values : Array<T1>) -> Array<T2> {
        return values.map({ (t1) -> T2 in
            return transform(value: t1)
        })
    }
    
    func reverseTransformCollection(values : Array<T2>) -> Array<T1> {
        return values.map({ (t2) -> T1 in
            return reverseTransform(value: t2)
        })
    }
}
