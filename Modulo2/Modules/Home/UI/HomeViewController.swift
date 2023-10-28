//
//  HomeViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
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
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = HomeLocalizable.homeFindLocationTitle
        label.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(openLocationChooser))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var coffeeShopsTableView: UIHeightResizableTableView = {
        let tableView = UIHeightResizableTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightGray
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CoffeeShopTableViewCell.self, forCellReuseIdentifier: "userInformationCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var bottomConstraint = coffeeShopsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    private var coffeeShopViews: [CoffeeShopView] = []

    var presenter: HomePresenterProtocol?
    var locationManager: LocationManagerProtocol?
    var locationConverter: LocationConverterStrategyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeLocalizable.homeSreenTitle
        setupViews()
        setupTableViewDelegates()
        presenter?.initialize()
        presenter?.attachView(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.obtainNearCoffeeShops(with: LocationParams(latitude: 0.0, longitude: 0.0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.resolveDefaultLocation()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow

        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(coffeeShopsTableView)
        
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
            
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            coffeeShopsTableView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 16),
            coffeeShopsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            coffeeShopsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            bottomConstraint
        ])
    }
    
    private func setupTableViewDelegates() {
        coffeeShopsTableView.dataSource = self
        coffeeShopsTableView.delegate = self
    }
    
    @objc private func openLocationChooser() {
        navigationController?.pushViewController(LocationChooserRouter.launch(with: { [weak self] location in
            self?.addressLabel.text = location.address
            self?.presenter?.obtainNearCoffeeShops(with: LocationParams(latitude: location.latitude, longitude: location.longitude))
        }), animated: true)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeShopViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userInformationCell") as? CoffeeShopTableViewCell else {
            return UITableViewCell()
        }
        cell.coffeeShopView = coffeeShopViews[indexPath.row]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(CoffeeShopDetailRouter.launch(using: "12345"), animated: true)
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func showDefaultLocation(with favoriteLocation: Location) {
        addressLabel.text = favoriteLocation.toLocationString()
    }
    
    func showCoffeeShops(with coffeeShopsList: [CoffeeShop]) {
        coffeeShopViews = coffeeShopsList.toCoffeeShopViewList()
        coffeeShopsTableView.reloadData()
    }
    
    func requestLocation() {
        debugPrint("REQUESTING LOCATION")
    }
    
    func showError(message: String) {
        debugPrint("ERROR: \(message)")
    }
}
