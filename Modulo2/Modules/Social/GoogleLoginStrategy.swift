//
//  GoogleLoginStrategy.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UIKit
import GoogleSignIn

class GoogleLoginStrategy: SocialAuthStategy {
    
    func resolveLogin(using viewController: UIViewController, with authResult: @escaping (SocialAuthResult) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, error in
            if let signInResult = signInResult {
                let user = signInResult.user
                authResult(.success(SocialAuthProfile(id: user.userID ?? "", email: user.profile?.email ?? "")))
            } else if let error = error {
                authResult(.error(error.localizedDescription))
            }
        }
    }
}
