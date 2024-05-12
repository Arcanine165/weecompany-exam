//
//  AllCountriesProtocols.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

protocol AllCountriesPresenterProtocol : AnyObject{
    var view : AllCountriesViewProtocol? {get set}
    var service : AllCountriesServiceProtocol? {get set}
    func viewDidLoad()
}

protocol AllCountriesViewProtocol : AnyObject{
    func reloadData(countries: [Country])
    func goToDetail(name : String)
}

protocol AllCountriesServiceProtocol : AnyObject{
    func getCountries(completion : @escaping ([Country]?,NetworkError?)->Void)
}
