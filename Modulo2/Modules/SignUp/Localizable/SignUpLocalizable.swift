//
//  SignUpLocalizable.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import Foundation

class SignUpLocalizable: LocalizableProtocol {
    static var localizableFileName: String = "SignUpLocalizable"
    
    static let signUpNameErrorMessage = SignUpMessageKeys.nameError.rawValue.localized(with: localizableFileName)
    static let signLastNameErrorMessage = SignUpMessageKeys.lastNameError.rawValue.localized(with: localizableFileName)
    static let signUpEmailErrorMessage = SignUpMessageKeys.emailError.rawValue.localized(with: localizableFileName)
    static let signUpAgeErrorMessage = SignUpMessageKeys.ageError.rawValue.localized(with: localizableFileName)
    static let signUpSuccessErrorMessage = SignUpMessageKeys.success.rawValue.localized(with: localizableFileName)
}
