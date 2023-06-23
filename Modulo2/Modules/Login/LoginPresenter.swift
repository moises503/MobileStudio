//
//  LoginPresenter.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginViewProtocol? = nil
    
    func attachView(view: LoginViewProtocol) {
        self.view = view
    }
    
    func tryToLogin(with email: String, and password: String) {
        if email.isEmpty || password.isEmpty {
            view?.showErrorMessage(with: LoginLocalizable.loginErrorMessage)
            return
        }
        view?.showHomeView()
    }
}
