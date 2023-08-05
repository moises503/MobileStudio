//
//  UIImageView+Extensions.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 05/08/23.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(
        with url: String,
        and imageOptions: ImageLoadingOptions,
        and processors: [ImageProcessing] = []
    ) {
        Nuke.loadImage(with: ImageRequest(url: URL(string: url), processors: processors), options: imageOptions, into: self)
    }
}
