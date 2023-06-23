//
//  LoginPresenterProtocol.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation

protocol LoginPresenterProtocol {
    func attachView(view: LoginViewProtocol)
    func tryToLogin(with email: String, and password: String)
}
