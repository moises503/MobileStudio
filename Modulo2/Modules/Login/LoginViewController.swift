//
//  LoginViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import AuthenticationServices

class LoginViewController: UIViewController {
    
    private var scrollableContent: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemBackground
        view.isDirectionalLockEnabled = true
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = LoginLocalizable.loginEmailHint
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = LoginLocalizable.loginPasswordHint
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(LoginLocalizable.loginButtonHint, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(SignUpLocalizable.signUpButtonText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var fbLoginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Iniciar sesión con facebook", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(facebookLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var googleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Iniciar sesión con Google", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var appleLoginButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(appleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomConstraint = signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
    private var presenter: LoginPresenterProtocol?
    private let socialManager: SocialManager = SocialManagerImpl()
    private let appleLoginManager: AppleLoginManager = AppleLoginManagerImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Iniciar sesión"
        setupViews()
        presenter = LoginPresenter()
        presenter?.attachView(view: self)
    }
    
    @objc
    private func loginAction(_ sender: Any) {
        presenter?.tryToLogin(with: emailTextField.orEmpty(), and: passwordTextField.orEmpty())
    }
    
    @objc private func facebookLogin(_ sender: Any) {
        socialManager.requestLogin(with: self, using: .facebook) { [weak self] result in
            switch result {
            case .success(let socialAuthProfile):
                /// Send  auth profile to your API to save user information
                // TODO: Add proper flow to send information to the API
                break
            case .cancelled(let cancelledReason):
                self?.showErrorMessage(with: cancelledReason)
            case .error(let errorReason):
                self?.showErrorMessage(with: errorReason)
            }
        }
    }
    
    @objc private func googleLogin() {
        socialManager.requestLogin(with: self, using: .google) { [weak self] result in
            switch result {
            case .success(let socialAuthProfile):
                /// Send  auth profile to your API to save user information
                // TODO: Add proper flow to send information to the API
                break
            case .cancelled(let cancelledReason):
                self?.showErrorMessage(with: cancelledReason)
            case .error(let errorReason):
                self?.showErrorMessage(with: errorReason)
            }
        }
    }
    
    @objc private func appleLogin() {
        appleLoginManager.login(using: self) { [weak self] result in
            switch result {
            case .success(let socialAuthProfile):
                /// Send  auth profile to your API to save user information
                // TODO: Add proper flow to send information to the API
                break
            case .cancelled(let cancelledReason):
                self?.showErrorMessage(with: cancelledReason)
            case .error(let errorReason):
                self?.showErrorMessage(with: errorReason)
            }
        }
    }
    
    @objc
    private func showSignUp(_ sender: Any) {
        navigationController?.pushViewController(SignUpFromScratchViewController(), animated: true)
    }
    
    private func setupViews() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow

        view.backgroundColor = .systemBackground
        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)
        
        contentView.addSubview(loginImageView)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(fbLoginButton)
        contentView.addSubview(googleLoginButton)
        contentView.addSubview(appleLoginButton)
        contentView.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            scrollableContent.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollableContent.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollableContent.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollableContent.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),

            loginImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 16),
            loginImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            loginImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            loginImageView.centerXAnchor.constraint(greaterThanOrEqualTo: contentView.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            fbLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32),
            fbLoginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            fbLoginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            googleLoginButton.topAnchor.constraint(equalTo: fbLoginButton.bottomAnchor, constant: 32),
            googleLoginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            googleLoginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            appleLoginButton.topAnchor.constraint(equalTo: googleLoginButton.bottomAnchor, constant: 32),
            appleLoginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            appleLoginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: appleLoginButton.bottomAnchor, constant: 32),
            signUpButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomConstraint
        ])
    }

}

extension LoginViewController: LoginViewProtocol {
    
    func showHomeView() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
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

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
