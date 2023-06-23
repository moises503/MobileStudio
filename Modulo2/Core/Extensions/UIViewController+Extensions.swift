//
//  UIViewController+Extensions.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(with alertMessage: AlertMessage) {
        let alertController = UIAlertController(title: alertMessage.title, message: alertMessage.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertMessage.acceptButtonTitle, style: .default, handler: { _ in
            alertMessage.acceptEventHandler?()
        }))
        if let cancelTitle = alertMessage.cancelButtonTitle {
            alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { _ in
                alertMessage.cancelEventHandler?()
            }))
        }
        present(alertController, animated: true)
    }
}
