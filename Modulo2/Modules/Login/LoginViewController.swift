//
//  LoginViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter = LoginPresenter()
        presenter?.attachView(view: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter?.tryToLogin(with: emailTextField.orEmpty(), and: passwordTextField.orEmpty())
    }
    
    private func setupViews() {
        emailTextField.placeholder = LoginLocalizable.loginEmailHint
        passwordTextField.placeholder = LoginLocalizable.loginPasswordHint
        loginButton.setTitle(LoginLocalizable.loginButtonHint, for: .normal)
    }

}

extension LoginViewController: LoginViewProtocol {
    
    func showHomeView() {
        
    }
    
    func showErrorMessage(with message: String) {
        presentAlert(with: AlertMessage(
            title: LoginLocalizable.loginErrorTitle,
            message: message,
            acceptButtonTitle: LoginLocalizable.loginPromptAccept,
            cancelButtonTitle: LoginLocalizable.loginPromptCancel,
            acceptEventHandler: { [weak self] in
                self?.emailTextField.becomeFirstResponder()
            }
        )
        )
    }
}
