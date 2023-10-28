//
//  SocialAuthStrategy.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UIKit

protocol SocialAuthStategy {
    func resolveLogin(using viewController: UIViewController, with authResult: @escaping(SocialAuthResult) ->  Void)
}
