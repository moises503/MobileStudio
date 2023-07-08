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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cafeterías cercanas"
        setupViews()
        populateUserInformation()
        setupTableViewDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow

        view.backgroundColor = .systemBackground
        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)
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
            
            coffeeShopsTableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            coffeeShopsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            coffeeShopsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            bottomConstraint
        ])
    }
    
    private func setupTableViewDelegates() {
        coffeeShopsTableView.dataSource = self
        coffeeShopsTableView.delegate = self
    }
    
    private func populateUserInformation() {
        for index in 1...40 {
            coffeeShopViews.append(CoffeeShopView(
                id: "\(index)",
                name: "Information \(index)",
                address: "Information about \(index)",
                isFavorite: false,
                services: [.backery, .coffee]
            )
            )
        }
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
    
}