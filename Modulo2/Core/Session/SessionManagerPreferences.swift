//
//  SessionManagerPreferences.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation

class SessionManagerPreferences: SessionManagerPreferencesProtocol {
    
    func saveToken(with notificationToken: String) {
        DispatchQueue.main.async {
            UserDefaults.standard.set(notificationToken, forKey: SessionKeys.firebaseToken.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getNotificationToken() -> String {
        return UserDefaults.standard.string(forKey: SessionKeys.firebaseToken.rawValue) ?? ""
    }
    
    enum SessionKeys: String {
        case firebaseToken
    }
}
