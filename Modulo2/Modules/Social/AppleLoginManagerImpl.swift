//
//  AppleLoginManagerImpl.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import AuthenticationServices
import UIKit

class AppleLoginManagerImpl: NSObject, AppleLoginManager, ASAuthorizationControllerDelegate {
    
    private var authResult: ((SocialAuthResult) -> Void)?
    
    func login(using presentationContext: ASAuthorizationControllerPresentationContextProviding?, with authResult: @escaping(SocialAuthResult) -> Void) {
        self.authResult = authResult
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = presentationContext
        authorizationController.performRequests()
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        resolveAppleLogin(authorization: authorization)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        authResult?(.error(error.localizedDescription))
    }
    
    private func resolveAppleLogin(authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            let userIdentifier = credentials.user
            let email = credentials.email ?? ""
            authResult?(.success(SocialAuthProfile(id: userIdentifier, email: email)))
        default: break
        }
    }
}
