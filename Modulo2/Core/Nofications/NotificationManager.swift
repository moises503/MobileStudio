//
//  NotificationManager.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 28/10/23.
//

import Foundation
import UserNotifications
import FirebaseMessaging

class NotificationManager: NSObject, NotificationManagerProtocol, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    private weak var sessionPreferences: SessionManagerPreferencesProtocol?

    init(sessionPreferences: SessionManagerPreferencesProtocol = SessionManagerPreferences()) {
        self.sessionPreferences = sessionPreferences
    }
    
    // MARK: Protocol
    func registerNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            Messaging.messaging().delegate = self
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    // MARK: Firebase push notifications
    func messaging(didReceiveRegistrationToken fcmToken: String) {
        sessionPreferences?.saveToken(with: fcmToken)
    }
    
    // MARK: Notification center
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("User info: \(userInfo)")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.list, .banner, .badge, .sound])
            let userData = notification.request.content.userInfo
            print("*** Notification Data:\(userData.description)")
        } else {
            completionHandler([.badge, .sound])
        }
    }
}

