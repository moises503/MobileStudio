//
//  AllertMessage.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import Foundation


struct AlertMessage {
    var title: String
    var message: String
    var acceptButtonTitle: String
    var cancelButtonTitle: String?
    var acceptEventHandler: (() -> Void)?
    var cancelEventHandler: (() -> Void)?
}
