//
//  UserInformationTableViewCell.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 24/06/23.
//

import UIKit

class UserInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userInformationTitle: UILabel!
    @IBOutlet weak var userInformationContent: UILabel!
    
    var userInformation: UserInformation? {
        didSet {
            userInformationTitle.text = userInformation?.title ?? ""
            userInformationContent.text = userInformation?.content ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
