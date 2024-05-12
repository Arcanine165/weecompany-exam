//
//  CountryDetailProtocols.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

protocol CountryDetailViewProtocol : AnyObject{
    var presenter : CountryDetailPresenterProtocol? {get set}
    func loadInfo(country : Country)
}
protocol CountryDetailPresenterProtocol : AnyObject{
    func viewDidLoad(countryName : String)
}

protocol CountryDetailServiceProtocol : AnyObject{
    func getCountryData(countryName : String,completion : @escaping (Country?,NetworkError?)->Void)
}
