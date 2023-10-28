//
//  FirebaseTokenProvider.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation

protocol FirebaseTokenProviderProtocol: AnyObject {
    func obtainFirebaseToken(with tokenResult: @escaping (TokenResult) -> Void)
}
