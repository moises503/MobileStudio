//
//  SignUpFromScratchViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import UIKit

class SignUpFromScratchViewController: UIViewController {
    
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
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = SignUpLocalizable.signUpNameHint
        textField.keyboardType = .default
        textField.textContentType = .name
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Agrega un correo electrónico"
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
        textField.placeholder = "Introduce una contraseña"
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordConfirmationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Vuelve a introducir la contraseña"
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(SignUpLocalizable.signUpButtonText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomConstraint = signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)
        
        contentView.addSubview(nameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(passwordConfirmationTextField)
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
            
            nameTextField.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordConfirmationTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            passwordConfirmationTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordConfirmationTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            signUpButton.topAnchor.constraint(equalTo: passwordConfirmationTextField.bottomAnchor, constant: 32),
            signUpButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 300),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomConstraint
        ])
    }
    
    @objc private func signUpAction() {
        print("Signed up ...")
    }
}
