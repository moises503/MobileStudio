//
//  SocialAuthResult.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation

enum SocialAuthResult {
    case success(SocialAuthProfile)
    case cancelled(String)
    case error(String)
}
