//
//  LocationChooserViewController.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import UIKit
import GooglePlaces

class LocationChooserViewController: UIViewController {
    
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
    
    private lazy var obtainLocationFromGPSLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.text = HomeLocalizable.homeFindLocationTitle
        label.font = UIFont.preferredFont(forTextStyle: .title3, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onRequestLocation))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var obtainLocationFromSearchPlacesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.text = "Buscar la dirección"
        label.font = UIFont.preferredFont(forTextStyle: .title3, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onSerchPlace))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var locationsTableView: UIHeightResizableTableView = {
        let tableView = UIHeightResizableTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightGray
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LocationItemTableViewCell.self, forCellReuseIdentifier: "locationItemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var bottomConstraint = locationsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    private var locations: [Location] = []
    
    var presenter: LocationChooserPresenterProtocol?
    var locationManager: LocationManagerProtocol?
    var locationConverter: LocationConverterStrategyProtocol?
    
    var onLocationObtained: ((Location) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.attachView(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.obtainLocationsSaved()
    }
    
    private func setupViews() {
        title = "Ubicación"
        view.backgroundColor = .systemBackground
        let safeAreaGuide = view.safeAreaLayoutGuide
        let contentLayoutGuide = scrollableContent.contentLayoutGuide
        let frameLayoutGuide = scrollableContent.frameLayoutGuide
        bottomConstraint.priority = .defaultLow
        
        view.addSubview(scrollableContent)
        scrollableContent.addSubview(contentView)
        contentView.addSubview(obtainLocationFromGPSLabel)
        contentView.addSubview(obtainLocationFromSearchPlacesLabel)
        contentView.addSubview(locationsTableView)
        
        
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
            
            obtainLocationFromGPSLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            obtainLocationFromGPSLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            obtainLocationFromGPSLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            obtainLocationFromSearchPlacesLabel.topAnchor.constraint(equalTo: obtainLocationFromGPSLabel.bottomAnchor, constant: 16),
            obtainLocationFromSearchPlacesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            obtainLocationFromSearchPlacesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            locationsTableView.topAnchor.constraint(equalTo: obtainLocationFromSearchPlacesLabel.bottomAnchor, constant: 32),
            locationsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            locationsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bottomConstraint
        ])
    }
    
    @objc private func onRequestLocation() {
        locationManager?.verifyLocationPermission(onPermissionResult: { [weak self] locationResultPermission in
            self?.presenter?.resolveLocationPermission(with: locationResultPermission)
        })
    }
    
    @objc private func onSerchPlace() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(GMSPlaceField.name.rawValue) |
                                                  UInt64(GMSPlaceField.placeID.rawValue))
        autocompleteController.placeFields = fields
        
        let filter = GMSAutocompleteFilter()
        filter.types = ["address"]
        autocompleteController.autocompleteFilter = filter
        
        present(autocompleteController, animated: true, completion: nil)
    }
}

extension LocationChooserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationItemCell") as? LocationItemTableViewCell else {
            return UITableViewCell()
        }
        let location = locations[indexPath.row]
        cell.address = location.address
        cell.isFavorite = location.isFavorite
        return cell
    }
}

extension LocationChooserViewController: LocationChooserViewProtocol {
    
    func showEmptyLocations() {
        
    }
    
    func showLocationsSaved(with locationList: [Location]) {
        locations = locationList
        locationsTableView.reloadData()
    }
    
    func showError(with message: String) {
        
    }
    
    func permissionDenied() {
        debugPrint("Permission denied")
    }
    
    func proceedToRequestLocation() {
        locationManager?.recoverLocation(onLocationObtained: { [weak self] coordinate in
            self?.locationConverter?.resolveLocation(with: coordinate, completion: { location in
                guard let location = location else {
                    return
                }
                self?.presenter?.saveLocationObtained(with: location)
            })
        })
    }
    
    func locationSaved(with locationObtained: Location) {
        onLocationObtained?(locationObtained)
        navigationController?.popViewController(animated: true)
    }
}


extension LocationChooserViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        debugPrint("view controller has found an error: \(error)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        debugPrint("view controller was cancelled")
    }
}
