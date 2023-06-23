//
//  LoginLocalizable.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation

class LoginLocalizable: LocalizableProtocol {
    static var localizableFileName: String = "LoginLocalizable"
    
    static let loginEmailHint = LoginLocalizableKeys.loginEmailHint.rawValue.localized(with: localizableFileName)
    static let loginPasswordHint = LoginLocalizableKeys.loginPasswordHint.rawValue.localized(with: localizableFileName)
    static let loginButtonHint = LoginLocalizableKeys.loginButtonHint.rawValue.localized(with: localizableFileName)
    static let loginErrorMessage = LoginLocalizableKeys.loginErrorMessage.rawValue.localized(with: localizableFileName)
    static let loginErrorTitle = LoginLocalizableKeys.loginErrorTitle.rawValue.localized(with: localizableFileName)
    static let loginPromptAccept = LoginLocalizableKeys.loginPromptAccept.rawValue.localized(with: localizableFileName)
    static let loginPromptCancel = LoginLocalizableKeys.loginPromptCancel.rawValue.localized(with: localizableFileName)
}
