//
//  CoffeeShopDetailPresenter.swift
//  Modulo2
//
//  Created by Moisés Garduño Reyes on 14/10/23.
//

import Foundation

class CoffeeShopDetailPresenter: CoffeeShopDetailPresenterProtocol {
    
    private weak var view: CoffeeShopDetailViewProtocol?
    private var repository: CoffeeShopDetailRepositoryProtocol
    
    init(repository: CoffeeShopDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func attachView(view: CoffeeShopDetailViewProtocol) {
        self.view = view
    }
    
    func obtainDetail(using coffeeShopId: String?) {
        if let coffeeShopId = coffeeShopId {
            repository.getDetail(using: coffeeShopId) { [weak self] CoffeeDetailResult in
                switch CoffeeDetailResult {
                case .success(let coffeeDetail):
                    self?.view?.showDetail(using: coffeeDetail)
                case .error(let coffeeAppError):
                    self?.view?.showError(with: coffeeAppError.localizedDescription)
                }
            }
        } else {
            view?.showError(with: "Debes proporcionar el identificador de la sucursal")
        }
    }
}
