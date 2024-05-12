//
//  CountryDetailService.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class CountryDetailService : CountryDetailServiceProtocol {
    func getCountryData(countryName: String, completion : @escaping (Country?,NetworkError?)->Void) {
        RemoteManager.setRequest(type: [Country].self ,endpoint: .name, param: countryName,httpMethod: "GET") {result in
            switch result {
            case .success(let success):
                completion(success.first,nil)
            case .failure(let failure):
                completion(nil,failure)
            }
        }
    }
    
    
}
