//
//  LocationChooserViewController.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 22/07/23.
//

import UIKit

class LocationChooserViewController: UIViewController {
    
    var presenter: LocationChooserPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attachView(view: self)
    }
}


extension LocationChooserViewController: LocationChooserViewProtocol {
    
    func showEmptyLocations() {
        
    }
    
    func showLocationsSaved(with locationList: [Location]) {
        
    }
    
    func showError(with message: String) {
        
    }
}
