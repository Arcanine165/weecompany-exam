//
//  CountryDetailPresenter.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class CountryDetailPresenter : CountryDetailPresenterProtocol {
    var service : CountryDetailService
    weak var view : CountryDetailViewProtocol?
    
    init(view : CountryDetailViewProtocol,service: CountryDetailService) {
        self.service = service
        self.view = view
    }
    
    func viewDidLoad(countryName: String) {
        service.getCountryData(countryName: countryName) {[weak self] country, error in
            guard let country = country, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.view?.loadInfo(country: country)
            }
        }
    }
}
