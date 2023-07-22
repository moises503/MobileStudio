//
//  UserInformationTableViewCell.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 24/06/23.
//

import UIKit

class CoffeeShopTableViewCell: UITableViewCell {
    
    private lazy var coffeeShopCardView: UICoffeeShopCardView = {
        let view = UICoffeeShopCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var coffeeShopView: CoffeeShopView? {
        didSet {
            coffeeShopCardView.coffeeShopView = coffeeShopView
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .lightGray
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        contentView.addSubview(coffeeShopCardView)
        NSLayoutConstraint.activate([
            coffeeShopCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            coffeeShopCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            coffeeShopCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coffeeShopCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
