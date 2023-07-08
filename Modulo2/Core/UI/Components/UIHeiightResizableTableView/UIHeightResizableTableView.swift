//
//  UIResizableTableView.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 08/07/23.
//

import Foundation
import UIKit

class UIHeightResizableTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }

    override var contentSize: CGSize {
        didSet{
            invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
    }
}
