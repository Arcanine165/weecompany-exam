//
//  AllCountriesPresenter.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class AllCountriesPresenter : AllCountriesPresenterProtocol{
    var service: AllCountriesServiceProtocol?
    weak var view : AllCountriesViewProtocol?
    
    func viewDidLoad() {
        service?.getCountries{[weak self] countries, error in
            guard let countries = countries, error == nil else {
                return
            }
            self?.view?.reloadData(countries:countries)
            
        }
    }
    
    
}
