//
//  CoffeeShopCardView.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 08/07/23.
//

import Foundation
import UIKit
import Nuke

class UICoffeeShopCardView: UIView {
    
    private lazy var coffeeShopImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "coffeePlaceholder")
        view.contentMode = .scaleToFill
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
        view.spacing = 4
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
    
    private var presenter: CoffeeShopPresenterProtocol?
    
    var coffeeShopView: CoffeeShopView? {
        didSet {
            presenter?.renderCoffeeShopView(using: coffeeShopView)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        presenter = CoffeeShopPresenter()
        presenter?.attachView(view: self)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 32

        addSubview(coffeeShopImageView)
        addSubview(coffeeShopTitleLabel)
        addSubview(coffeeShopAddressLabel)
        addSubview(coffeeShopFavoriteImageView)
        addSubview(coffeeShopAvailableServicesStackView)
        
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
            
            coffeeShopImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            coffeeShopImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            coffeeShopImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            coffeeShopImageView.widthAnchor.constraint(equalToConstant: 120),
            coffeeShopImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            coffeeShopFavoriteImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            coffeeShopFavoriteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            coffeeShopFavoriteImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 28),
            coffeeShopFavoriteImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 28),
            
            coffeeShopTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            coffeeShopTitleLabel.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: coffeeShopFavoriteImageView.leadingAnchor, constant: -4),
            
            coffeeShopAddressLabel.topAnchor.constraint(equalTo: coffeeShopTitleLabel.bottomAnchor, constant: 4),
            coffeeShopAddressLabel.leadingAnchor.constraint(lessThanOrEqualTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopAddressLabel.trailingAnchor.constraint(equalTo: coffeeShopFavoriteImageView.leadingAnchor, constant: -4),
            
            coffeeShopAvailableServicesStackView.topAnchor.constraint(equalTo: coffeeShopAddressLabel.bottomAnchor, constant: 8),
            coffeeShopAvailableServicesStackView.leadingAnchor.constraint(equalTo: coffeeShopImageView.trailingAnchor, constant: 8),
            coffeeShopAvailableServicesStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8),
        ])
    }
}


extension UICoffeeShopCardView: CoffeeShopViewProtocol {
    
    func displayCoffeeShopView(with coffeeShopView: CoffeeShopView) {
        coffeeShopTitleLabel.text = coffeeShopView.name
        coffeeShopAddressLabel.text = coffeeShopView.address
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "restaurantPlaceholder"),
            transition: .fadeIn(duration: 0.5),
            failureImage: UIImage(named: "restaurantPlaceholder"),
            failureImageTransition: .fadeIn(duration: 0.5)
        )
        coffeeShopImageView.loadImage(with: coffeeShopView.imageURL ?? "", and: options)
    }
    
    func markAsFavorite() {
        coffeeShopFavoriteImageView.image = UIImage(named: "favoriteFilled")
    }
    
    func markAsNonFavorite() {
        coffeeShopFavoriteImageView.image = UIImage(named: "favorite")
    }
    
    func petFriendlyAvalaible() {
        coffeeShopAvailableServicesStackView.addArrangedSubview(petFriendlyIconImageView)
    }
    
    func bakeryAvailable() {
        coffeeShopAvailableServicesStackView.addArrangedSubview(bakeryIconImageView)
    }
    
    func coffeeAvailable() {
        coffeeShopAvailableServicesStackView.addArrangedSubview(coffeeIconImageView)
    }
    
    func wifiAvailbale() {
        coffeeShopAvailableServicesStackView.addArrangedSubview(wifiIconImageView)
    }
}
