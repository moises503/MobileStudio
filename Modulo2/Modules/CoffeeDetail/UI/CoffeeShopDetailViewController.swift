//
//  CoffeeShopDetailViewController.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import UIKit
import GoogleMaps

class CoffeeShopDetailViewController: UIViewController {
    
    private var scrollableContent: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .lightGray
        view.isDirectionalLockEnabled = true
        view.alwaysBounceVertical = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mapView: GMSMapView = {
        let view = GMSMapView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productsTableView: UIHeightResizableTableView = {
        let tableView = UIHeightResizableTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightGray
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        return tableView
    }()
    private lazy var bottomConstraint = productsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    private var products: [CoffeeProduct] = []
    
    var presenter: CoffeeShopDetailPresenterProtocol?
    var coffeeShopId: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle de la sucursal"
        presenter?.attachView(view: self)
        setupViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.obtainDetail(using: coffeeShopId)
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow

        
        contentView.addSubview(mapView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(productsTableView)
        
        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollableContent.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollableContent.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollableContent.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollableContent.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
        
            mapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mapView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            productsTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            productsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bottomConstraint
        ])
    }
}

extension CoffeeShopDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.product = products[indexPath.row]
        return cell
    }
}

extension CoffeeShopDetailViewController: CoffeeShopDetailViewProtocol {
    func showError(with message: String) {
        debugPrint("ERROR: \(message)")
    }
    
    func showDetail(using coffeeDetail: CoffeeDetail) {
        titleLabel.text = coffeeDetail.title
        descriptionLabel.text = coffeeDetail.description
        products = coffeeDetail.products
        let camera = GMSCameraPosition.camera(withLatitude: coffeeDetail.location.latitude, longitude: coffeeDetail.location.longitude, zoom: 16.0)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coffeeDetail.location.latitude, longitude: coffeeDetail.location.longitude)
        marker.title = coffeeDetail.title
        marker.snippet = coffeeDetail.description
        marker.map = mapView
        mapView.camera = camera
        productsTableView.reloadData()
    }
}
