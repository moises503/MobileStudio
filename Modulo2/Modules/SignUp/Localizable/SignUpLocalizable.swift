//
//  SignUpLocalizable.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import Foundation

class SignUpLocalizable: LocalizableProtocol {
    static var localizableFileName: String = "SignUpLocalizable"
    
    static let signUpNameErrorMessage = SignUpLocalizableKeys.nameError.rawValue.localized(with: localizableFileName)
    static let signLastNameErrorMessage = SignUpLocalizableKeys.lastNameError.rawValue.localized(with: localizableFileName)
    static let signUpEmailErrorMessage = SignUpLocalizableKeys.emailError.rawValue.localized(with: localizableFileName)
    static let signUpAgeErrorMessage = SignUpLocalizableKeys.ageError.rawValue.localized(with: localizableFileName)
    static let signUpSuccessErrorMessage = SignUpLocalizableKeys.success.rawValue.localized(with: localizableFileName)
    static let signUpNameHint = SignUpLocalizableKeys.nameHint.rawValue.localized(with: localizableFileName)
    static let signUpButtonText = SignUpLocalizableKeys.signUpButtonText.rawValue.localized(with: localizableFileName)
}
