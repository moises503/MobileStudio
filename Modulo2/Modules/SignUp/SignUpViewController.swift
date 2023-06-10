//
//  ViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    @IBAction func validateInformation(_ sender: Any) {
        let name: String =  nameTextField.orEmpty()
        let lastName: String = lastNameTextField.orEmpty()
        let email: String = emailTextField.orEmpty()
        let age: String = ageTextField.orEmpty()
        
        if name.isEmpty {
            messageLabel.text = SignUpLocalizable.signUpNameErrorMessage
            return
        }
        
        if lastName.isEmpty {
            messageLabel.text = SignUpLocalizable.signLastNameErrorMessage
            return
        }
        
        if email.isEmpty {
            messageLabel.text = SignUpLocalizable.signUpEmailErrorMessage
            return
        }
        
        if age.isEmpty {
            messageLabel.text = SignUpLocalizable.signUpAgeErrorMessage
            return
        }
        messageLabel.textColor = .blue
        messageLabel.textAlignment = .center
        messageLabel.text = SignUpLocalizable.signUpSuccessErrorMessage
    }
}
