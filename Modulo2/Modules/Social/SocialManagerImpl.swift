//
//  SocialManagerImpl.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UIKit

class SocialManagerImpl: SocialManager {
    private let facebookStrategy = FacebookLoginStrategy()
    private let googleStrategy = GoogleLoginStrategy()
    
    func requestLogin(with viewController: UIViewController, using strategy: SocialAuthType, with authResult: @escaping (SocialAuthResult) -> Void) {
        switch strategy {
        case .facebook:
            facebookStrategy.resolveLogin(using: viewController, with: authResult)
        case .google: 
            googleStrategy.resolveLogin(using: viewController, with: authResult)
        }
    }
}
