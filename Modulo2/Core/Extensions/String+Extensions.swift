//
//  String+Extensions.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 10/06/23.
//

import Foundation

extension String {
    func localized(with table: String) -> String {
        let localized = NSLocalizedString(self,
                                          tableName: table,
                                          comment: "")
        return localized
    }
}
