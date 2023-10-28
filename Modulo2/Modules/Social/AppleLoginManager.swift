//
//  AppleLoginManager.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import AuthenticationServices
import UIKit

protocol AppleLoginManager {
    func login(using presentationContext: ASAuthorizationControllerPresentationContextProviding?, with authResult: @escaping(SocialAuthResult) -> Void)
}
