//
//  ProductTableViewCell.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var product: CoffeeProduct? {
        didSet {
            titleLabel.text = product?.title
            descriptionLabel.text = product?.description
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
        productContainerView.addSubview(titleLabel)
        productContainerView.addSubview(descriptionLabel)
        
        contentView.addSubview(productContainerView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: productContainerView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: productContainerView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: productContainerView.trailingAnchor, constant: -4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: productContainerView.leadingAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: productContainerView.trailingAnchor, constant: -4),
            descriptionLabel.bottomAnchor.constraint(equalTo: productContainerView.bottomAnchor, constant: -4),
            productContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            productContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            productContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
