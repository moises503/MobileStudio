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
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .callout, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coffeeShopAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Reserva territorial Atlixcayotl Centro comercial Angelópolis"
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .caption2, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coffeeShopFavoriteImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "favoriteCoffeeShop")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coffeeShopAvailableServicesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var coffeeIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "coffeIcon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bakeryIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bakeryIcon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petFriendlyIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "petFriendlyIcon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var wifiIconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wifiIcon")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        coffeeShopAvailableServicesStackView.addArrangedSubview(coffeeIconImageView)
        coffeeShopAvailableServicesStackView.addArrangedSubview(bakeryIconImageView)
        coffeeShopAvailableServicesStackView.addArrangedSubview(petFriendlyIconImageView)
        coffeeShopAvailableServicesStackView.addArrangedSubview(wifiIconImageView)

        coffeShopContentView.addSubview(coffeeShopImageView)
        coffeShopContentView.addSubview(coffeeShopTitleLabel)
        coffeShopContentView.addSubview(coffeeShopAddressLabel)
        coffeShopContentView.addSubview(coffeeShopFavoriteImageView)
        coffeShopContentView.addSubview(coffeeShopAvailableServicesStackView)
        
        
        NSLayoutConstraint.activate([
            
            // Coffee shop services icon
            coffeeIconImageView.widthAnchor.constraint(equalToConstant: 24),
            coffeeIconImageView.heightAnchor.constraint(equalToConstant: 24),
            bakeryIconImageView.widthAnchor.constraint(equalToConstant: 24),
            bakeryIconImageView.heightAnchor.constraint(equalToConstant: 24),
            petFriendlyIconImageView.widthAnchor.constraint(equalToConstant: 24),
            petFriendlyIconImageView.heightAnchor.constraint(equalToConstant: 24),
            wifiIconImageView.widthAnchor.constraint(equalToConstant: 24),
            wifiIconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            coffeeShopImageView.topAnchor.constraint(equalTo: coffeShopContentView.topAnchor, constant: 8),
            coffeeShopImageView.bottomAnchor.constraint(equalTo: coffeShopContentView.bottomAnchor, constant: -8),
            coffeeShopImageView.leadingAnchor.constraint(equalTo: coffeShopContentView.leadingAnchor, constant: 8),
            coffeeShopImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 86),
            
            coffeeShopFavoriteImageView.topAnchor.constraint(equalTo: coffeShopContentView.topAnchor, constant: 24),
            coffeeShopFavoriteImageView.trailingAnchor.constraint(equalTo: coffeShopContentView.trailingAnchor, constant: -12),
            coffeeShopFavoriteImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 28),
            coffeeShopFavoriteImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 28),
            
            coffeeShopTitleLabel.topAnchor.constraint(equalTo: coffeShopContentView.topAnchor, constant: 18),
            coffeeShopTitleLabel.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopTitleLabel.trailingAnchor.constraint(equalTo: coffeeShopFavoriteImageView.leadingAnchor, constant: -4),
            
            coffeeShopAddressLabel.topAnchor.constraint(equalTo: coffeeShopTitleLabel.bottomAnchor, constant: 4),
            coffeeShopAddressLabel.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopAddressLabel.trailingAnchor.constraint(equalTo: coffeeShopFavoriteImageView.leadingAnchor, constant: -4),
            
            coffeeShopAvailableServicesStackView.topAnchor.constraint(equalTo: coffeeShopAddressLabel.bottomAnchor, constant: 8),
            coffeeShopAvailableServicesStackView.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopAvailableServicesStackView.trailingAnchor.constraint(lessThanOrEqualTo: coffeShopContentView.trailingAnchor, constant: -8),
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
