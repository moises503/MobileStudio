//
//  LoginRouter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    static func launch() -> LoginViewController {
        let controller = LoginViewController()
        return controller
    }

}
