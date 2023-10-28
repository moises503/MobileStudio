//
//  SocialManagerProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UIKit

protocol SocialManager: AnyObject {
    func requestLogin(with viewController: UIViewController, using strategy: SocialAuthType, with authResult: @escaping(SocialAuthResult) -> Void)
}
