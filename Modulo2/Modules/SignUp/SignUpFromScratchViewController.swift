//
//  SignUpFromScratchViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import UIKit

class SignUpFromScratchViewController: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameHintLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .yellow
        label.backgroundColor = .lightGray
        label.text = SignUpLocalizable.signUpNameHint
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = SignUpLocalizable.signUpNameHint
        textField.keyboardType = .default
        textField.textContentType = .name
        textField.returnKeyType = .next
        textField.textAlignment = .left
        textField.autocapitalizationType = .words
        textField.backgroundColor = .brown
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(SignUpLocalizable.signUpButtonText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        view.addSubview(contentView)
        contentView.addSubview(nameHintLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            nameHintLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameHintLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameHintLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameTextField.topAnchor.constraint(equalTo: nameHintLabel.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            signUpButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
            signUpButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        
    }
    
    @objc private func signUpAction() {
        print("Signed up ...")
    }
}
