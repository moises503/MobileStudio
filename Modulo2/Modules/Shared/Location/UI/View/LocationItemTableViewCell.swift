//
//  LocationTableViewCell.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 12/09/23.
//

import UIKit

class LocationItemTableViewCell: UITableViewCell {
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .caption2, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var address: String? {
        didSet {
            addressLabel.text = address
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
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupViews() {
        contentView.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])
    }
}
