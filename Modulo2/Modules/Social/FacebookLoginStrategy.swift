//
//  File.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookLoginStrategy: SocialAuthStategy {
    
    
    func resolveLogin(using viewController: UIViewController, with authResult: @escaping (SocialAuthResult) -> Void) {
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email","public_profile"], from: viewController) { (response, error) -> Void in
            if (error == nil){
                let fbloginresult: LoginManagerLoginResult = response!
                if (response?.isCancelled)!{
                    authResult(.cancelled("Operación cancelada por el usuario"))
                }
                if(fbloginresult.grantedPermissions.contains("email")  && fbloginresult.grantedPermissions.contains("public_profile")){
                    self.retrieveUserInformation(result: authResult)
                } else {
                    authResult(.error("La operación no se puede completar"))
                }
            }
        }
    }
    
    
    private func retrieveUserInformation(result: @escaping (SocialAuthResult) -> Void) {
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id,name,email"]).start { connection, response, error in
                if (error == nil){
                    let info = response as! [String : AnyObject]
                    result(.success(SocialAuthProfile(id: info["id"] as? String ?? "", email: info["email"] as? String ?? "")))
                }
            }
        }
    }
}
