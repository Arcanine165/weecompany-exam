//
//  SearchCountryProtocols.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

protocol SearchCountryViewProtocol : AnyObject{
    var presenter : SearchCountryPresenterProtocol? {get set}
    func showCountryNotFound()
    func goToDetail(countryName: String,comesFromRecents : Bool)
}
protocol SearchCountryPresenterProtocol : AnyObject{
    var view : SearchCountryViewProtocol? {get set}
    var service : SearchCountryServiceProtocol? {get set}
    func searchCountry(countryName : String)
}
protocol SearchCountryServiceProtocol : AnyObject {
    func searchCountry(countryName : String, completion : @escaping (Country?,NetworkError?)->Void)
}
