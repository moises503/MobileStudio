//
//  UIFont+Extensions.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 08/07/23.
//

import UIKit

extension UIFont {
    
    class func preferredFont(forTextStyle style: UIFont.TextStyle, weight: Weight, size: CGFloat? = nil) -> UIFont {
        // 1
        let metrics = UIFontMetrics(forTextStyle: style)
        // 2
        let descriptor = preferredFont(forTextStyle: style).fontDescriptor
        let defaultSize = descriptor.pointSize
        // 3
        let fontToScale = UIFont.systemFont(ofSize: size ?? defaultSize, weight: weight)
        // 4
        return metrics.scaledFont(for: fontToScale)
    }
}
