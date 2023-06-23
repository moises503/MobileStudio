//
//  LoginViewProtocol.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func showHomeView()
    func showErrorMessage(with message: String)
}
