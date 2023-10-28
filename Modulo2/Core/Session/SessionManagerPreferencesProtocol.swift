//
//  SessionManagerPreferencesProtocol.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation

protocol SessionManagerPreferencesProtocol: AnyObject {
    
    func saveToken(with notificationToken: String)
    func getNotificationToken() -> String
}
