//
//  UserInformationTableViewCell.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 24/06/23.
//

import UIKit

class CoffeeShopTableViewCell: UITableViewCell {
    
    private lazy var coffeShopContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coffeeShopImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "coffeePlaceholder")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coffeeShopTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Starbucks Angelópolis"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        setupContentView()
        setupCoffeeShopContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCoffeeShopContentView() {
        coffeShopContentView.addSubview(coffeeShopImageView)
        coffeShopContentView.addSubview(coffeeShopTitleLabel)
        
        NSLayoutConstraint.activate([
            coffeeShopImageView.topAnchor.constraint(equalTo: coffeShopContentView.topAnchor, constant: 8),
            coffeeShopImageView.bottomAnchor.constraint(equalTo: coffeShopContentView.bottomAnchor, constant: -8),
            coffeeShopImageView.leadingAnchor.constraint(equalTo: coffeShopContentView.leadingAnchor, constant: 16),
            coffeeShopImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            coffeeShopTitleLabel.topAnchor.constraint(equalTo: coffeShopContentView.topAnchor, constant: 18),
            coffeeShopTitleLabel.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 16),
        ])
    }
    
    private func setupContentView() {
        contentView.addSubview(coffeShopContentView)
        NSLayoutConstraint.activate([
            coffeShopContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            coffeShopContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            coffeShopContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coffeShopContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
