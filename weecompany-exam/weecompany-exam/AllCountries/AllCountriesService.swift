//
//  AllCountriesService.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class AllCountriesService : AllCountriesServiceProtocol{
    func getCountries(completion : @escaping ([Country]?,NetworkError?)->Void) {
        RemoteManager.setRequest(type: [Country].self, endpoint: .all, httpMethod: "GET") {result in
            switch result {
            case .success(let success):
                completion(success,nil)
            case .failure(let failure):
                completion(nil,failure)
            }
        }
    }
}
