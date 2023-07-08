//
//  HomeViewController.swift
//  Modulo2
//
//  Created by Moisés  Garduño Reyes on 17/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var userInformationArray: [UserInformation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        populateUserInformation()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
    }
    
    private func populateUserInformation() {
        for index in 1...40 {
            userInformationArray.append(UserInformation(title: "Information \(index)", content: "Information about \(index)"))
        }
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInformationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userInformationCell") as? UserInformationTableViewCell else {
            return UITableViewCell()
        }
        cell.userInformation = userInformationArray[indexPath.row]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
