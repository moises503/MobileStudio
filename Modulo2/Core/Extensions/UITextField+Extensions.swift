//
//  UITextField+Extensions.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import Foundation
import UIKit

extension UITextField {
    
    func orEmpty() -> String {
        return self.text ?? ""
    }
}
