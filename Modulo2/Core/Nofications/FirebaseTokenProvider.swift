//
//  FirebaseTokenProvider.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import FirebaseMessaging

class FirebaseTokenProvider: FirebaseTokenProviderProtocol {
    
    private let sessionManager: SessionManagerPreferencesProtocol
    
    init(sessionManager: SessionManagerPreferencesProtocol) {
        self.sessionManager = sessionManager
    }
    
    func obtainFirebaseToken(with tokenResult: @escaping (TokenResult) -> Void) {
        let currentToken = sessionManager.getNotificationToken()
        if currentToken.isEmpty {
            if let freshToken = Messaging.messaging().fcmToken {
                sessionManager.saveToken(with: freshToken)
                tokenResult(.success(freshToken))
            } else {
                tokenResult(.error("Error token was not obtained"))
            }
        } else {
            tokenResult(.success(currentToken))
        }
    }
}
