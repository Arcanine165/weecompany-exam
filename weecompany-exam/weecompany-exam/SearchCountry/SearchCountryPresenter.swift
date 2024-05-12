//
//  SearchCountryPresenter.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class SearchCountryPresenter : SearchCountryPresenterProtocol {
    
    weak var view: SearchCountryViewProtocol?
    var service: SearchCountryServiceProtocol?
    
    init(view: SearchCountryViewProtocol, service: SearchCountryServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func searchCountry(countryName: String) {
       
        service?.searchCountry(countryName: countryName, completion: {[weak self] country, error in
            guard let country = country, error == nil else {
                print("entre")
                DispatchQueue.main.async {
                    self?.view?.showCountryNotFound()
                }
                return
            }
            DispatchQueue.main.async {
                self?.view?.goToDetail(countryName: country.name.official,comesFromRecents: false)
            }
        })
    }
   
    
}
